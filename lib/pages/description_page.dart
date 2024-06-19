import 'package:crud_firebase/pages/navbar.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 196, 250),
        title: const Text("Description Page"),
      ),
      body: Center(
        child: Container(
          width: 600, // Ancho del contenedor
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fondo_pets.jpg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                _buildCard(
                  'images/Objetivo.jpg', // Ruta de la imagen 1
                  'Objetivo',
                  'El objetivo principal de la aplicación móvil para la veterinaria es proporcionar una plataforma eficiente y fácil de usar para registrar y gestionar la información de los pacientes (mascotas). La aplicación permitirá a los usuarios registrar nuevas mascotas, visualizar sus datos y problemas médicos, y llevar un control organizado de las visitas y tratamientos realizados.',
                  'Texto a la derecha',
                ),
                SizedBox(height: 20),
                _buildCard(
                  'images/Beneficios.jpg', // Ruta de la imagen 2
                  'Beneficios',
                  '',
                  'La aplicación facilita la gestión eficiente de pacientes en la clínica veterinaria, permite el acceso rápido a la información de las mascotas, y mejora la organización y la comunicación dentro del equipo, resultando en un servicio más efectivo y una mejor experiencia tanto para el personal como para los clientes.',
                  reversed: true,
                ),
                SizedBox(height: 20),
                _buildCard(
                  'images/Interaccion.jpg', // Ruta de la imagen 1
                  'Interacción del Usuario',
                  'Los usuarios pueden registrar mascotas llenando un formulario, visualizar las tarjetas con los datos y problemas de las mascotas, y recibir notificaciones y recordatorios sobre citas y tratamientos, facilitando así la gestión y el seguimiento de los pacientes.',
                  'Texto a la derecha',
                ),
                SizedBox(height: 20),
                _buildCard(
                  'images/Diseño.jpg', // Ruta de la imagen 2
                  'Diseño',
                  'Texto a la derecha',
                  'El diseño de la página utiliza un esquema de colores en tonos celestes que resulta llamativo y agradable a la vista del usuario. El fondo blanco proporciona un contraste limpio y profesional, mientras que el azul celeste del encabezado y los elementos interactivos transmite una sensación de tranquilidad y confianza. Las tarjetas con la información de las mascotas están diseñadas con bordes redondeados y sombras suaves para dar un aspecto moderno y accesible.',
                  reversed: true,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    String imagePath,
    String title,
    String textLeft,
    String textRight, {
    bool reversed = false,
  }) {
    return Card(
      elevation: 5, // Elevación de la tarjeta
      child: Container(
        width: 600, // Ancho de la tarjeta
        padding: const EdgeInsets.all(20.0),
        color: Colors.lightBlue[50], // Color de fondo claro
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (reversed)
                  _buildText(textRight) // Texto a la derecha
                else
                  _buildImage(imagePath), // Imagen a la izquierda
                if (reversed)
                  _buildImage(imagePath) // Imagen a la izquierda
                else
                  _buildText(textLeft), // Texto a la izquierda
              ],
            ),
            SizedBox(height: 10),
            Text(
              'VET-PET',
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: 100, // Ancho de la imagen
      height: 100, // Alto de la imagen
      fit: BoxFit.cover,
    );
  }

  Widget _buildText(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

