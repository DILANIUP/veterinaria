import 'package:crud_firebase/service/firebase_service.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage.UpdateUser({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    phoneController.text = arguments['phone'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
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
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Enter Type',
              ),
            ),
              
            ElevatedButton(
              onPressed: () async {
                await updateUsers(arguments['uid'], nameController.text, phoneController.text);
                Navigator.pushNamed(context,'/userlist');
              },
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
