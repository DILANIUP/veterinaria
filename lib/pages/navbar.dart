import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""), 
            accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("images/user.jpg"),
              ),
            ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fondo_navbar.jpg"), 
                fit: BoxFit.cover, 
              ),
          )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, "/"),
                }
            ),

            Divider(color: Colors.black,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,),
            ListTile(
              leading: Icon(Icons.description),
              title: Text("Descripcion"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, "/description"),
                }
            ),


             Divider(color: Colors.black,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Informacion mascota"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, "/home"),
                }
            ),


            Divider(color: Colors.black,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text("Registro mascota"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, "/save"),
                }
            ),

            Divider(color: Colors.black,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Lista de usuarios"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, "/userlist"),
                }
            ),
          
            Divider(color: Colors.black,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,),
             ListTile(
            leading: Icon(Icons.logout),
            title: Text("Cerrar Sesion"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/buttonPage');
            },
          ),

        ]
      )
    );
  }
}