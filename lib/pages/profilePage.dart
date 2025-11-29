import 'package:projetofelype/Domain/user.dart';
import 'package:projetofelype/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // context.watch<ProfileProvider>() -> Acessar e Monitorar o ProfileProvider
    // Assim, quando uma alteração acontece no ProfileProvider, ele atualiza a pagina
    late User user = context.watch<ProfileProvider>().user;

    return Container(
      color: Color(0xFFFAFAFA),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                foregroundImage: NetworkImage(user.imageUrl),
                radius: 70,
              ),
            ),
            SizedBox(height: 12),
            buildText(text: user.name, fontSize: 21, fontWeight: FontWeight.w600),
            buildText(
              text: user.username,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }

  buildText({required text, color, double fontSize = 14.0, fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}