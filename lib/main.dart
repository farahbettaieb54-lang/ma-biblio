import 'package:flutter/material.dart';
import 'package:ma_biblio/data/livres_data.dart';
 import '../screens/parametres_screen.dart';
 import 'models/livre.dart';

void main() {
  runApp(const MaBiblioApp());
}

class MaBiblioApp extends StatelessWidget {
  const MaBiblioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaBiblio',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: const Text('Mes livres'),
  actions: [
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ParametresScreen()),
        );
      },
    ),
  ],
),
body: Column(
  children: livres.take(3).map(livreTile).toList(),
),
    );  
  }
}
Widget livreTile(Livre livre) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: livre.couleur,
      child: Text(
        livre.titre[0].toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
    title: Text(livre.titre),
    subtitle: Text('${livre.auteur} – ${livre.annee}'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min, // indispensable dans un trailing
      children: [
        Text('${livre.note}'),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.amber, size: 18),
      ],
    ),
  );
}