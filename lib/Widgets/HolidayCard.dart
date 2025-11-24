import 'package:flutter/material.dart';
import 'package:projetofelype/Domain/holiday.dart';
import 'package:google_fonts/google_fonts.dart';

class HolidayCard extends StatefulWidget {
  final Holiday holiday;
  
  const HolidayCard({
    required this.holiday,
    super.key
  });

  @override
  State<HolidayCard> createState() => _HolidayCardState();
}

class _HolidayCardState extends State<HolidayCard> {
  Holiday get holiday => widget.holiday;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF006A71),
      child: Container(
        child: buildText(
          text: '${widget.holiday.name} - ${widget.holiday.date}',
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

buildText ({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: GoogleFonts.inter(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}