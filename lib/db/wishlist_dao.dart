import 'package:flutter/material.dart';
import 'package:projetofelype/Widgets/ItemCard.dart';
import 'lojinha_dao.dart';

class ListaDesejosPage extends StatefulWidget {
  const ListaDesejosPage({super.key});

  @override
  _ListaDesejosPageState createState() => _ListaDesejosPageState();
}

class _ListaDesejosPageState extends State<ListaDesejosPage> {
  final DesejoDao desejoDao = DesejoDao();
  final CardLojaDao produtoDao = CardLojaDao();
  List<CardLoja> produtosDesejados = [];

  @override
  void initState() {
    super.initState();
    carregarDesejos();
  }

  Future<void> carregarDesejos() async {
    List<int> desejoIds = await desejoDao.listarTodos();
    List<CardLoja> todosProdutos = await produtoDao.listarProdutos();
    setState(() {
      produtosDesejados =
          todosProdutos.where((p) => desejoIds.contains(p.id)).toList();
    });
  }

  Future<void> removerDesejo(CardLoja produto) async {
    await desejoDao.remover(produto.id);
    await carregarDesejos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Desejos"),
        backgroundColor: const Color(0xFF006A71),
      ),
      body: produtosDesejados.isEmpty
          ? const Center(
        child: Text(
          "Nenhum produto na lista de desejos.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      )
          : GridView.count(
        crossAxisCount: 2,
        children: produtosDesejados.map((produto) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    produto.imagem,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Text(produto.nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(produto.descricao,
                    style: const TextStyle(color: Colors.grey)),
                Text("R\$ ${produto.preco.toStringAsFixed(2)}"),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => removerDesejo(produto),
                )
              ],
            ),
          );
        }).toList(),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }
}

FloatingActionButton buildFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {
      // Aqui você pode abrir a LojaPage ou outra ação
    },
    elevation: 0,
    backgroundColor: const Color(0xFF006A71),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
    foregroundColor: const Color(0xFF000000),
    child: const Icon(
      Icons.add,
      size: 40.0,
    ),
  );
}

BottomAppBar buildBottomAppBar() {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    color: const Color(0xFF006A71),
    child: IconTheme(
      data: const IconThemeData(),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 40.0,
              onPressed: () {
                // Aqui pode navegar para a Home (LojaPage)
              },
              icon: const Icon(Icons.home_filled),
            ),
            const SizedBox(width: 24.0),
            IconButton(
              iconSize: 40.0,
              onPressed: () {
                // Aqui pode ser estatísticas ou relatórios
              },
              icon: const Icon(Icons.bar_chart_rounded),
            ),
          ],
        ),
      ),
    ),
  );
}