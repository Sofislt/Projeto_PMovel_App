class Local {
  late String urlImage;
  late String local;

  Local({
    required this.urlImage,
    required this.local,
  });

  Local.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlImage'];
    local = json['local'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urlImage'] = this.urlImage;
    data['local'] = this.local;
    return data;
  }
}
