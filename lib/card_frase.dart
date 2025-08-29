import 'dart:ui';
import 'package:flutter/material.dart';

class CardFrase extends StatefulWidget {
  //Propriedade propriedade;

  CardFrase({
    //required this.propriedade,
    super.key,
  });

  @override
  State<CardFrase> createState() => _CardFraseState();
}

class _CardFraseState extends State<CardFrase> {
  //String get urlImage => widget.urlImage;
  //Propriedade get propriedade => widget.propriedade;

  // String getUrlImage {
  //   return widget.urlImage;
  // }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // A caixa de diálogo
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
                  Text(
                    "Mensagem motivacional",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "frase",
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
