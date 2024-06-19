import 'package:flutter/material.dart';
import 'package:crud_firebase/pages/navbar.dart';
import 'package:crud_firebase/service/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo_pets.jpg'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajuste de la imagen
          ),
        ),
        child: FutureBuilder(
          future: getAnimals(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No hay datos disponibles.'));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dos columnas
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final animalName = snapshot.data![index]['name'];
                  final animalType = snapshot.data![index]['type'];
                  final animalProblem = snapshot.data![index]['problem'];
                  final uid = snapshot.data![index]['uid'];

                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.pushNamed(context, '/update', arguments: {
                          'name': animalName,
                          'type': animalType,
                          'problem': animalProblem,
                          'uid': uid,
                        });
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120, // Altura de la imagen
                              width: 120,
                              child: Image.network(
                                'images/animal_perfil.jpg',
                                fit: BoxFit.cover, // Ajuste de la imagen
                              ),
                            ),
                            SizedBox(width: 16), // Espacio entre la imagen y los campos de texto
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    initialValue: animalName,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Nombre',
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(color: Colors.black), // Texto negro
                                  ),
                                  TextFormField(
                                    initialValue: animalType,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Tipo',
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(color: Colors.black), // Texto negro
                                  ),
                                  TextFormField(
                                    initialValue: animalProblem,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Problema',
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(color: Colors.black), // Texto negro
                                  ),
                                  SizedBox(height: 16), // Espacio entre los datos y el botón de eliminar
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      bool confirmDelete = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('¿Seguro de eliminar a $animalName?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, false),
                                                child: const Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await deleteAnimals(uid);
                                                  Navigator.pop(context, true);
                                                },
                                                child: const Text('Confirmar'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (confirmDelete == true) {
                                        setState(() {
                                          snapshot.data!.removeAt(index);
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
