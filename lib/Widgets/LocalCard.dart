import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projetofelype/Domain/Local.dart';
import 'package:projetofelype/pages/mapPage.dart';

class LocalCard extends StatefulWidget {
  Local local;

  LocalCard({
    required this.local,
    super.key,
  });

  @override
  State<LocalCard> createState() => _LocalCardState();
}

class _LocalCardState extends State<LocalCard> {
  // String get urlImage => widget.urlImage;
  Local get local => widget.local;

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(local.urlImage),
          ),
          SizedBox(height: 16,),
          Row(
            //Informações da imagem
          ),
          Row(
            children: [
              Column(),
              TextButton(onPressed: () async {
                List<Location> locations = await locationFromAddress(local.local);
                LatLng position = LatLng(locations[0].latitude, locations[0].longitude);

                Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return mapPage(posicao: position);
                    },
                  ),
                );
              },
              child: buildText(text: "Ver no mapa"))
            ],
          ),
        ],
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