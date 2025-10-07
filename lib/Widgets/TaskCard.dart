import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetofelype/domain/task.dart';

class TaskCard extends StatefulWidget {
  Task task;

  TaskCard({
    required this.task,
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskcardState();
}

class _TaskcardState extends State<TaskCard> {
  Task get task => widget.task;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF006A71),
      child: Container(
        width: 2,
        height: 60,
        child: Column(
          children: [
            buildText(
              text: widget.task.titulo,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            buildText(
              text: widget.task.descricao,
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