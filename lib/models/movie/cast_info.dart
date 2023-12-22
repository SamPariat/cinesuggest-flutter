import './actor_info.dart';
import './director_info.dart';

class CastInfo {
  final List<ActorInfo> actors;
  final List<DirectorInfo> director;

  CastInfo({
    required this.actors,
    required this.director,
  });

  factory CastInfo.fromJson(Map<String, dynamic> json) => CastInfo(
        actors: List.from(json['actors']),
        director: List.from(json['director']),
      );
}
