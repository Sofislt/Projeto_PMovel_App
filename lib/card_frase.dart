import 'package:projetofelype/frase.dart';
import 'package:flutter/material.dart';

class CardFrase extends StatefulWidget {
  Frase frase;

  CardFrase({
    required this.frase,
    super.key,
  });

  @override
  State<CardFrase> createState() => _CardFraseState();
}

class _CardPropriedadeState extends State<CardFrase> {
  // String get urlImage => widget.urlImage;
  Frase get propriedade => widget.frase;

  // String getUrlImage {
  //   return widget.urlImage;
  // }

  @override
  Widget build(BuildContext context) {
    return