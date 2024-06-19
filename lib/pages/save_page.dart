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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo_pets.jpg'), // Asegúrate de que esta ruta sea correcta
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Opacity(
                opacity: 0.9, // Ajusta la opacidad aquí
                child: Card(
                  color: Colors.white.withOpacity(0.9), // Fondo blanco con opacidad
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Name',
                            filled: true,
                            fillColor: Colors.white70, // Fondo blanco con algo de transparencia para el texto
                          ),
                        ),
                        SizedBox(height: 10), // Espacio entre los campos
                        TextField(
                          controller: typeController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Type',
                            filled: true,
                            fillColor: Colors.white70, // Fondo blanco con algo de transparencia para el texto
                          ),
                        ),
                        SizedBox(height: 10), // Espacio entre los campos
                        TextField(
                          controller: problemController,
                          decoration: const InputDecoration(
                            labelText: 'Enter problem',
                            filled: true,
                            fillColor: Colors.white70, // Fondo blanco con algo de transparencia para el texto
                          ),
                        ),
                        SizedBox(height: 20), // Espacio entre el último campo y el botón
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
