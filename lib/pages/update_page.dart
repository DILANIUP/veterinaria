import 'package:crud_firebase/service/firebase_service.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    typeController.text = arguments['type'];
    problemController.text = arguments['problem'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Animal'),
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
                labelText: 'Enter Problem',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await updateAnimals(arguments['uid'], nameController.text, typeController.text, problemController.text);
                Navigator.pop(context);
              },
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
