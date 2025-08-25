class Desempenho {
  late double tarefasAtrasadas;
  late double tarefasAdiantadas;
  late double terefasDentroDoPrazo;

  Desempenho({
    required this.tarefasAtrasadas,
    required this.tarefasAdiantadas,
    required this.terefasDentroDoPrazo,
  });

  Desempenho.fromJson(Map<String, dynamic> json) {
    tarefasAtrasadas = json['tarefasAtrasadas'];
    tarefasAdiantadas = json['tarefasAdiantadas'];
    terefasDentroDoPrazo = json['terefasDentroDoPrazo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tarefasAtrasadas'] = this.tarefasAtrasadas;
    data['tarefasAdiantadas'] = this.tarefasAdiantadas;
    data['terefasDentroDoPrazo'] = this.terefasDentroDoPrazo;
    return data;
  }
}