import 'dart:convert';

List<User> usersFromMapArray(List<dynamic> arr) => arr.map((e) => User.fromMap(e)).toList();

class User {
  final int id;
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  User({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      avatarUrl: map['avatar_url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
