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
      avatarUrl: map['avatarUrl'] ?? '',
      htmlUrl: map['htmlUrl'] ?? '',
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.login == login &&
        other.avatarUrl == avatarUrl &&
        other.htmlUrl == htmlUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ login.hashCode ^ avatarUrl.hashCode ^ htmlUrl.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, login: $login, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl)';
  }
}
