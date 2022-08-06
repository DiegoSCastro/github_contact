import 'dart:convert';

class UserDetails {
  final String login;
  final int id;
  final String avatarUrl;
  final String htmlUrl;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final String? bio;
  final String? twitterUsername;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;

  UserDetails({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
  });

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      avatarUrl: map['avatar_url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      name: map['name'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      company: map['company'],
      blog: map['blog'],
      location: map['location'],
      email: map['email'],
      bio: map['bio'],
      twitterUsername: map['twitter_username'],
      publicRepos: map['public_repos']?.toInt(),
      publicGists: map['public_gists']?.toInt(),
      followers: map['followers']?.toInt(),
      following: map['following']?.toInt(),
    );
  }

  factory UserDetails.fromJson(String source) => UserDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDetails(login: $login, id: $id, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, company: $company, blog: $blog, location: $location, email: $email, bio: $bio, twitterUsername: $twitterUsername, publicRepos: $publicRepos, publicGists: $publicGists, followers: $followers, following: $following)';
  }
}
