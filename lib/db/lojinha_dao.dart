import '../db/db_helper.dart';
import '../serviceApi/serviceapi.dart';

class DaoAppPLoja {
  final dbHelper = DBHelper();
  final apiService = ApiService();

  Future<void> sincronizarProdutos() async {
    try {
      final produtos = await apiService.fetchAllProducts();
      await dbHelper.limparProdutos();

      for (var p in produtos) {
        await dbHelper.inserirProduto({
          'nome': p['title'],
          'descricao': p['description'],
          'preco': p['price'],
          'imagem': p['image'],
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
}
