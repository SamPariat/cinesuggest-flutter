class CommonDetails {
  final String imagePath;

  CommonDetails({
    required this.imagePath,
  });

  factory CommonDetails.fromJson(Map<String, dynamic> json) => CommonDetails(
        imagePath: json['imagePath'],
      );
}
