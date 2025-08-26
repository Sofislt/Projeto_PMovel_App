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
    preco = json['preco'] is int ? (json['preco'] as int).toDouble() : json['preco'];
    imagem = json['imagem'];
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'imagem': imagem,
    };
  }
}


