class User {
  int id;
  String name;
  String email;
  String phone;
  String website;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.website});

  factory User.fromJson(Map json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        website: json['website']);
  }

  Map toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "website": website,
    };
  }
}
