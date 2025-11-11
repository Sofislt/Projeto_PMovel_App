import 'package:flutter/material.dart';
import '../db/db_helper.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final dbHelper = DBHelper();
  List<Map<String, dynamic>> desejos = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarDesejos();
  }

  Future<void> carregarDesejos() async {
    final lista = await dbHelper.getDesejos();
    setState(() {
      desejos = lista;
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Desejos 💖"),
        backgroundColor: const Color(0xFF006A71),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : desejos.isEmpty
          ? const Center(child: Text("Nenhum item na sua lista de desejos"))
          : ListView.builder(
        itemCount: desejos.length,
        itemBuilder: (context, index) {
          final produto = desejos[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Image.network(
                produto['imagem'],
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(produto['nome']),
              subtitle: Text(
                'R\$ ${produto['preco'].toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.green),
              ),
            ),
          );
        },
      ),
    );
  }
}