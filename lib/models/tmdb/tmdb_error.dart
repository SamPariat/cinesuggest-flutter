class TmdbError {
  final String success;
  final int statusCode;
  final String statusMessage;

  TmdbError({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory TmdbError.fromJson(Map<String, dynamic> json) => TmdbError(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
      );
}
