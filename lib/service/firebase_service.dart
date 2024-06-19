import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getAnimals() async {
  List animals = [];
  QuerySnapshot querySnapshot = await db.collection('animals').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final animal = {
      'name': data['name'],
      'type': data['type'],
      'problem': data['problem'],
      'uid': doc.id,
    };

    animals.add(animal);
  }
  return animals; 
}


Future<void> addAnimals(String name, String type, String problem) async {
  await db.collection("animals").add({"name": name, "type": type, "problem": problem});
}

Future<void> updateAnimals(String uid, String name, String type, String problem) async {
  await db.collection("animals").doc(uid).update({"name": name, "type": type, "problem": problem});
}

Future<void> deleteAnimals(String uid) async {
  await db.collection("animals").doc(uid).delete();
}

/* Future<void> addUser(String name, String password, String email, String phone) async {
  await db.collection("users").add({
    "name": name,
    "password": password,
    "email": email,
    "phone": phone,
  });
} */

//Autenticacion - Login
Future<Map<String, dynamic>?> authenticateUser(String nameOrEmail, String password) async {
  String hashedPassword = sha256.convert(utf8.encode(password)).toString();
  CollectionReference collectionReferencePeople = db.collection('users');
  QuerySnapshot query = await collectionReferencePeople
      .where('name', isEqualTo: nameOrEmail)
      .where('password', isEqualTo: hashedPassword) // Compara la contraseña encriptada
      .get();

  if (query.docs.isEmpty) {
    query = await collectionReferencePeople
        .where('email', isEqualTo: nameOrEmail)
        .where('password', isEqualTo: hashedPassword) // Compara la contraseña encriptada
        .get();
  }

  if (query.docs.isNotEmpty) {
    return query.docs.first.data() as Map<String, dynamic>;
  }

  return null;
}


// Recuerda definir este método fuera de cualquier clase.
Future<void> addUser(String name, String password, String email, String phone) async {
  await db.collection("users").add({
    "name": name,
    "password": password,
    "email": email,
    "phone": phone,
  });
}

Future<void> updateUsers(String uid, String name,  String phone) async {
  await db.collection("people").doc(uid).update({"name": name, "phone": phone});
}