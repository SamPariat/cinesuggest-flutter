import './common_details.dart';

class DirectorInfo extends CommonDetails {
  final String name;

  DirectorInfo({
    required super.imagePath,
    required this.name,
  });

  factory DirectorInfo.fromJson(Map<String, dynamic> json) => DirectorInfo(
        imagePath: json['imagePath'],
        name: json['name'],
      );
}
