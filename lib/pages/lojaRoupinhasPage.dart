import 'package:flutter/material.dart';
import '../db/lojinha_dao.dart';
import 'wishlistPage.dart';

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
    setState(() => carregando = true);
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
        title: const Text('Loja de Roupinhas'),
        backgroundColor: const Color(0xFF006A71),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: sincronizarComAPI,
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WishlistPage()),
            ),
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
          return FutureBuilder<bool>(
              future: dao.isFavorito(produto['id']),
              builder: (context, snapshot) {
                final isFav = snapshot.data ?? false;
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              child: Image.network(
                                produto['imagem'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            produto['nome'] ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            'R\$ ${produto['preco'].toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          icon: Icon(
                            isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                            isFav ? Colors.pink : Colors.grey[400],
                          ),
                          onPressed: () async {
                            await dao.toggleFavorito(produto['id']);
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
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
            Icon(Icons.favorite, size: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}