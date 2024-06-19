import 'package:cloud_firestore/cloud_firestore.dart';

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