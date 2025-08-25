class CardLoja {
  late int id;
  late String nome;
  late String descricao;
  late double preco;
  late String imagem;


  CardLoja({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imagem,
  });


  CardLoja.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
    imagem = json['imagem'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['preco'] = preco;
    data['imagem'] = imagem;
    return data;
  }
}


