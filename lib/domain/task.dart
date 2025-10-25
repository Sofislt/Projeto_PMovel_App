class Task {
  late String titulo;
  late String descricao;

  Task ({
    required this.titulo,
    required this.descricao,
  });

  Task.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'] ?? '';
    descricao = json['descricao'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    return data;
  }
}