import 'package:flutter/material.dart';
import 'package:crud_firebase/service/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _nameOrEmail = '';
  late String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo_pets.jpg'), 
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.9), 
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close, color: Colors.black),
                        ),
                      ],
                    ),
                    const Text(
                      "INICIO DE SESION",
                      style: TextStyle(
                        fontFamily: "DMSerifDisplay",
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nombre de usuario o correo electrónico *",
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Ingrese su nombre de usuario o correo';
                        }
                        return null;
                      },
                      onChanged: (valor) {
                        setState(() {}); 
                      },
                      onSaved: (valor) {
                        _nameOrEmail = valor!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Contraseña *",
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        return null;
                      },
                      onChanged: (valor) {
                        setState(() {});
                      },
                      onSaved: (valor) {
                        _password = valor!;
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 200.0), 
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Autenticación del usuario
                          var user = await authenticateUser(_nameOrEmail, _password);
                          if (user != null) {
                            // Usuario autenticado correctamente
                            Navigator.pushNamed(context, "/");
                          } else {
                            // Error de autenticación
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Ingrese su usuaro o contraseña correctos')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Color.fromARGB(255, 92, 189, 189), // Fondo 
                      ),
                      child: const Text('Acceder', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text(
                        "¿Sin cuenta? Regístrate",
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 77, 66),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
