import './common_details.dart';

class ActorInfo extends CommonDetails {
  final String name;
  final String character;

  ActorInfo({
    required super.imagePath,
    required this.name,
    required this.character,
  });

  factory ActorInfo.fromJson(Map<String, dynamic> json) => ActorInfo(
        imagePath: json['imagePath'],
        name: json['name'],
        character: json['character'],
      );
}
