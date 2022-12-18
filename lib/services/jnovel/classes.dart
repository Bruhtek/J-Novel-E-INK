class ProfileInfo {
  String username;
  String email;
  bool emailVerified;

  // 2 letter language code
  String country;

  // membership level status, e.g. "free", "member", "premium"
  String level;

  DateTime createdAt;

  ProfileInfo({
    required this.username,
    required this.email,
    required this.emailVerified,
    required this.country,
    required this.level,
    required this.createdAt,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) {
    return ProfileInfo(
      username: json['username'],
      email: json['email'],
      emailVerified: json['emailVerified'],
      country: json['country'],
      level: json['level'],
      createdAt: DateTime.parse(json['created']),
    );
  }
}
