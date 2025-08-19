import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final String titulo;
  final String? descricao;

  const TaskCard({
    required this.titulo,
    this.descricao,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      color: Color(0xFF006A71),
      child: Container(
        width: 2,
        height: 60,
        child: Column(
          children: [
            buildText(
              text: titulo,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            buildText(
              text: descricao,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

buildText({required text, color, fontSize, fontWeight}) {
  return Text(
    text,
    style: GoogleFonts.inter(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}