import 'package:flutter/material.dart';
import '../models/livre.dart'; // Livre + liste `livres`

class GalerieScreen extends StatelessWidget {
  const GalerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galerie')),
      body: GridView.extent(
        maxCrossAxisExtent: 150, // Q5.6
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        childAspectRatio: 0.7,
        children: livres.map((l) {
          return Card(
            color: l.couleur,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.menu_book, color: Colors.white, size: 36),
                  const SizedBox(height: 8),
                  Text(
                    l.titre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.auteur,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
//Q5.2. Axe principal = sens du défilement (vertical) : mainAxisSpacing espace les lignes. Axe secondaire = perpendiculaire : crossAxisSpacing espace les colonnes.
//Q5.3. childAspectRatio = largeur / hauteur. 0.7 donne des cases plus hautes que larges (format « couverture de livre »), 1.0 des carrés, 1.5 des cases plus larges.
//Q5.4. En horizontal, crossAxisCount fixe le nombre de lignes et la grille défile de gauche à droite.
//Q5.6. Avec GridView.extent, le nombre de colonnes s’adapte à la largeur de l’écran (cases de 150 px max). Avec GridView.count, le nombre de colonnes est fixe et ce sont les cases qui s’étirent.