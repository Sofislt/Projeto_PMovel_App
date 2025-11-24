class Holiday {
  late String date;
  late String name;
  late String type;

  Holiday({
    required this.date,
    required this.name,
    required this.type,
  });

  String get feriado => '$name - $date';

  Holiday.fromJson(Map<String, dynamic> json) {
    date = json['date'] ?? '';
    name = json['name'] ?? '';
    type = json['type'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['name'] = this.name;
    data['type'] = this.type;

    return data;
  }
}