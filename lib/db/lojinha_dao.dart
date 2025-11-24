import 'package:projetofelype/db/db_helper.dart';
import 'package:projetofelype/api/service_api.dart';

class DaoAppPLoja {
  final DBHelper dbHelper = DBHelper();
  final apiService = ApiService();

  Future<void> sincronizarProdutos() async {
    try {
      final produtos = await apiService.fetchAllProducts();
      await dbHelper.limparProdutos();

      for (var p in produtos) {
        await dbHelper.inserirProduto({
          'nome': p['nome'],
          'descricao': p['descricao'],
          'preco': p['preco'],
          'categoria': p['categoria'],
          'imagem': p['imagem'],
          'nota': p['avaliacao']?['nota'] ?? 0.0,
          'votos': p['avaliacao']?['votos'] ?? 0,
        });
      }

      print('Produtos sincronizados com sucesso!');
    } catch (e) {
      print('Erro ao sincronizar produtos: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getProdutosLocal() async {
    return await dbHelper.getProdutos();
  }

  // ---------- FAVORITOS ----------
  Future<void> toggleFavorito(int produtoId) async {
    final isFav = await dbHelper.isFavorito(produtoId);
    if (isFav) {
      await dbHelper.removerDesejo(produtoId);
    } else {
      await dbHelper.adicionarDesejo(produtoId);
    }
  }

  Future<bool> isFavorito(int produtoId) async {
    return await dbHelper.isFavorito(produtoId);
  }
}