class Chart {
  final String url;

  Chart({required this.url});

  // Factory constructor para criar a instância a partir de JSON
  factory Chart.fromJson(Map<String, dynamic> json) {
    return Chart(url: json['data'] ?? '');
  }
}
