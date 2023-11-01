import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}