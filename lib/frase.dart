class Frase {
  late String frases;


  Frase({
    required this.frases,
  });

  Frase.fromJson(Map<String, dynamic> json) {
    frases = json['frases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frases'] = this.frases;
    return data;
  }
}