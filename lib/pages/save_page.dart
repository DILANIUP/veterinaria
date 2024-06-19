import 'package:crud_firebase/service/firebase_service.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de la mascota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
              ),
            ),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: 'Enter Type',
              ),
            ),
            TextField(
              controller: problemController,
              decoration: const InputDecoration(
                labelText: 'Enter problem',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await addAnimals(nameController.text, typeController.text, problemController.text);

                
                Navigator.pushReplacementNamed(context, '/home'); 
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}