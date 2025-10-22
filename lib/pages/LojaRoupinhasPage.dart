import 'package:flutter/material.dart';
import '../db/lojinha_dao.dart';


class LojaRoupinhasApp extends StatelessWidget {
  const LojaRoupinhasApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LojaPage(),
    );
  }
}


class LojaPage extends StatefulWidget {
  const LojaPage({super.key});


  @override
  State<LojaPage> createState() => _LojaPageState();
}


class _LojaPageState extends State<LojaPage> {
  final dao = DaoAppPLoja();
  List<Map<String, dynamic>> produtos = [];
  bool carregando = true;


  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }


  Future<void> carregarProdutos() async {
    final lista = await dao.getProdutosLocal();
    setState(() {
      produtos = lista;
      carregando = false;
    });
  }


  Future<void> sincronizarComAPI() async {
    await dao.sincronizarProdutos();
    await carregarProdutos();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Produtos atualizados!')),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Roupinhas',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF006A71),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: sincronizarComAPI,
          ),
        ],
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: produto['imagem']
                          ?.toString()
                          .startsWith('http') ==
                          true
                          ? Image.network(produto['imagem'],
                          fit: BoxFit.cover)
                          : Image.asset(
                          produto['imagem'] ??
                              'assets/roupa.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(produto['nome'] ?? 'Produto',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(produto['descricao'] ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12)),
                  Text(
                    'R\$ ${produto['preco'].toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: sincronizarComAPI,
        backgroundColor: const Color(0xFF006A71),
        child: const Icon(Icons.add, size: 40),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFF006A71),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_filled, size: 40, color: Colors.white),
            SizedBox(width: 24),
            Icon(Icons.bar_chart_rounded, size: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}






