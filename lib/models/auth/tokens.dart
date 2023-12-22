class Tokens {
  final String accessToken;
  final String refreshToken;

  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
}
