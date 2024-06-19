import 'package:crud_firebase/pages/list_users.dart';
import 'package:crud_firebase/pages/description_page.dart';
import 'package:crud_firebase/pages/login.dart';
import 'package:crud_firebase/pages/principal.dart';
import 'package:crud_firebase/pages/navbar.dart';
import 'package:crud_firebase/pages/register.dart';
import 'package:crud_firebase/pages/save_page.dart';
import 'package:crud_firebase/pages/update_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer App',
      initialRoute: "/",
      routes: {
        "/home": (context) => Home(),
        "/myapp": (context) => MyApp(),
        "/update": (context) => UpdatePage(),
        "/save": (context) => SavePage(),
        "/description": (context) => DescriptionPage(),
        "/userlist": (context) => UserListScreen(),
        "/buttonPage": (context) => ButtonPage(),
        "/register": (context) => Register(),
        "/login": (context) => loguearse()
      },
      home: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text('Bienvenido'),
          backgroundColor:
              Color.fromARGB(255, 129, 196, 250), // Color del app bar
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/fondo_pets.jpg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Colors.lightBlue[50],
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '¡Bienvenido a VET-PET!',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Gracias por elegir nuestra aplicación. Esperamos que disfrutes de tu experiencia con nosotros.',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 20), // Espacio entre la Card y la imagen
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'images/veterinaria.jpg',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          20), // Espacio entre la primera Card y las siguientes Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.lightBlue[50], // Color celeste opaco
                          elevation: 4.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  '¿Cómo cuidar a tu mascota?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold), // Negrita
                                ),
                                subtitle: Text(
                                    'Cuidar de una mascota requiere compromiso, amor y responsabilidad. Independientemente del tipo de mascota, es crucial proporcionarles una dieta equilibrada y adecuada para su especie y tamaño, asegurarse de que tengan acceso constante a agua fresca y limpia, y proporcionar un entorno seguro y cómodo para vivir. Las visitas regulares al veterinario son esenciales para mantener la salud y detectar posibles problemas a tiempo.'),
                              ),
                              Image.asset(
                                'images/Cabra.jpg',
                                fit: BoxFit.cover,
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: Text('LEER MÁS'),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Espacio entre las Cards
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.lightBlue[50], // Color celeste opaco
                          elevation: 4.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.asset(
                                'images/Rana.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                  'Recomendaciones para cuidar a tu mascota',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold), // Negrita
                                ),
                                subtitle: Text(
                                    'Primero, asegúrate de proporcionar una dieta balanceada y adecuada para su especie, edad, y tamaño, evitando alimentos dañinos para su salud. Mantén su entorno limpio y seguro, con un espacio adecuado para dormir y jugar. Programa visitas regulares al veterinario para chequeos y vacunas, y mantén al día su higiene, incluyendo el cepillado y el baño según sea necesario.'),
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: Text('LEER MÁS'),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
