import 'package:flutter/material.dart';
import '../db/lojinha_dao.dart';

class ListaDeDesejos extends StatelessWidget {
  final dao = DaoAppPLoja();

  ListaDeDesejos({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dao.getProdutosLocal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        final produtos = snapshot.data ?? [];

        return ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final p = produtos[index];
            return ListTile(
              leading: p['imagem'] != null &&
                  p['imagem'].toString().startsWith('http')
                  ? Image.network(p['imagem'], width: 50)
                  : Image.asset(p['imagem'] ?? 'assets/roupa.png',
                  width: 50),
              title: Text(p['nome']),
              subtitle: Text('R\$ ${p['preco']}'),
            );
          },
        );
      },
    );
  }
}
