import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projetofelype/frase.dart';

class CardFrase extends StatefulWidget {
  Frase frase;

  CardFrase({
    required this.frase,
    super.key,
  });

  @override
  State<CardFrase> createState() => _CardFraseState();
}

class _CardFraseState extends State<CardFrase> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AlertDialog(
              backgroundColor: Colors.white.withOpacity(0.9),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Mensagem motivacional",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.frase.frases,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, height: 1.5),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
