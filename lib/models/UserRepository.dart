import 'dart:convert';

class UserRepository {
  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  final String description;
  final String createdAt;
  final String updatedAt;
  final String pushedAt;
  final String language;
  final String visibility;
  final String defaultBranch;
  final bool private;
  final bool fork;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool hasPages;
  final bool allowForking;
  final bool isTemplate;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;
  final int forks;
  final int openIssues;
  final int watchers;

  UserRepository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.language,
    required this.visibility,
    required this.defaultBranch,
    required this.private,
    required this.fork,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.allowForking,
    required this.isTemplate,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.openIssuesCount,
    required this.forks,
    required this.openIssues,
    required this.watchers,
  });

  factory UserRepository.fromMap(Map<String, dynamic> map) {
    return UserRepository(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      fullName: map['full_name'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      pushedAt: map['pushed_at'] ?? '',
      language: map['language'] ?? '',
      visibility: map['visibility'] ?? '',
      defaultBranch: map['default_branch'] ?? '',
      private: map['private'] ?? false,
      fork: map['fork'] ?? false,
      hasIssues: map['has_issues'] ?? false,
      hasProjects: map['has_projects'] ?? false,
      hasDownloads: map['has_downloads'] ?? false,
      hasWiki: map['has_wiki'] ?? false,
      hasPages: map['has_pages'] ?? false,
      allowForking: map['allow_forking'] ?? false,
      isTemplate: map['is_template'] ?? false,
      size: map['size']?.toInt() ?? 0,
      stargazersCount: map['stargazers_count']?.toInt() ?? 0,
      watchersCount: map['watchers_count']?.toInt() ?? 0,
      forksCount: map['forks_count']?.toInt() ?? 0,
      openIssuesCount: map['open_issues_count']?.toInt() ?? 0,
      forks: map['forks']?.toInt() ?? 0,
      openIssues: map['open_issues']?.toInt() ?? 0,
      watchers: map['watchers']?.toInt() ?? 0,
    );
  }

  factory UserRepository.fromJson(String source) => UserRepository.fromMap(json.decode(source));
}
