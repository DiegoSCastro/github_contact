import 'dart:convert';

class User {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      nodeId: map['nodeId'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      gravatarId: map['gravatarId'] ?? '',
      url: map['url'] ?? '',
      htmlUrl: map['htmlUrl'] ?? '',
      followersUrl: map['followersUrl'] ?? '',
      followingUrl: map['followingUrl'] ?? '',
      gistsUrl: map['gistsUrl'] ?? '',
      starredUrl: map['starredUrl'] ?? '',
      subscriptionsUrl: map['subscriptionsUrl'] ?? '',
      organizationsUrl: map['organizationsUrl'] ?? '',
      reposUrl: map['reposUrl'] ?? '',
      eventsUrl: map['eventsUrl'] ?? '',
      receivedEventsUrl: map['receivedEventsUrl'] ?? '',
      type: map['type'] ?? '',
      siteAdmin: map['siteAdmin'] ?? false,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'id': id,
      'nodeId': nodeId,
      'avatarUrl': avatarUrl,
      'gravatarId': gravatarId,
      'url': url,
      'htmlUrl': htmlUrl,
      'followersUrl': followersUrl,
      'followingUrl': followingUrl,
      'gistsUrl': gistsUrl,
      'starredUrl': starredUrl,
      'subscriptionsUrl': subscriptionsUrl,
      'organizationsUrl': organizationsUrl,
      'reposUrl': reposUrl,
      'eventsUrl': eventsUrl,
      'receivedEventsUrl': receivedEventsUrl,
      'type': type,
      'siteAdmin': siteAdmin,
    };
  }

  

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
