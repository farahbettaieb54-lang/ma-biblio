import 'package:flutter/material.dart';
import 'package:ma_biblio/main.dart';
import '../models/livre.dart';

class LivreCard extends StatelessWidget {
  final Livre livre;
  final VoidCallback? onTap;

  const LivreCard({super.key, required this.livre, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black54,
      color: Colors.white,
      // surfaceTintColor: Colors.teal, // Material 3 (alternative à color)
      clipBehavior: Clip.antiAlias, // Q4.5
      child: InkWell(
        onTap: onTap,
        child: livreTile(livre),
      ),
    );
  }
}