
import 'package:flutter/material.dart';
import 'package:ma_biblio/data/livres_data.dart';
import 'package:ma_biblio/main.dart';
import '../models/livre.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nouveautes = livres.where((l) => l.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Nouveautés',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: nouveautes.length,
              itemBuilder: (context, index) {
                final livre = nouveautes[index];
                return Container(
                  width: 110,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: livre.couleur,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      livre.titre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded( // <- la correction
            child: ListView.separated(
              itemCount: livres.length,
              itemBuilder: (context, index) => livreTile(livres[index]),
              separatorBuilder: (context, index) =>
                  const Divider(indent: 72, height: 1),
            ),
          ),
          ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: livres.length,
          itemBuilder: (context, index) => livreTile(livres[index]),
          separatorBuilder: (context, index) =>
          const Divider(indent: 72, height: 1),
          ),
        ],
      ),
    );
  }
}
// ListView(children: [...]) construit TOUS les widgets d'un coup, même ceux
// hors écran : 1 000 livres = 1 000 ListTile créés au démarrage, d'où une
// consommation mémoire élevée et un affichage lent.
// ListView.builder est « paresseux » (lazy) : itemBuilder n'est appelé que
// pour les éléments visibles (plus une petite marge). Quand on défile, les
// éléments qui sortent de l'écran sont libérés et de nouveaux sont construits
// à la demande. Le coût dépend de ce qui est affiché, pas de la taille de la liste.
