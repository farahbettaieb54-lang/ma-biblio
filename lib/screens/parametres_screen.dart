import 'package:flutter/material.dart';
class ParametresScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Screen'),
      ),
      body: Column(
        children: [
          ListTile(
              leading: Icon(Icons.person),
              title: Text('Mon profil'),
              subtitle: Text('Nom, e-mail, mot de passe'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profil sélectionné"))
                );
              },
            ), 
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              tileColor: Colors.indigo.shade50,        // fond de la tuile
              iconColor: Colors.indigo,                // leading et trailing
              textColor: Colors.indigo.shade900,       // title et subtitle
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              ),
              onTap: () {}, 
            ),
             ListTile(
              leading: Icon(Icons.language),
              title: Text('Langue'),
              subtitle: Text("Français"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(' À propos'),
              subtitle: const Text('Version 1.0.0\nÉquipe de développement'),
              dense: true,
            ),
        ],
      ),

    );
  }
}
