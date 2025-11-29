class User {
  late int id;
  late String name;
  late String imageUrl;
  late String username;
  late String password;

  User(this.username, this.password);

  User.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['username'] = username;
    json['password'] = password;
    return json;
  }
}