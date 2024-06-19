import 'package:crud_firebase/service/firebase_service.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _addUser() async {
    String name = _nameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    await addUser(name, password, email, phone);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User added successfully!')),
    );
    _nameController.clear();
    _passwordController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      initialRoute: "/addUser",
      routes: {
        "/addUser": (context) => Register(),
      },
    );
  }
}
