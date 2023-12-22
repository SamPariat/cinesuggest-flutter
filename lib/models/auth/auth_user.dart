class AuthUser {
  final String id;
  final String name;
  final String email;
  final int v;

  AuthUser({
    required this.id,
    required this.name,
    required this.email,
    required this.v,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        v: json['__v'],
      );
}
