import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_playlist_app/models/resource/resource.dart';
import 'package:youtube_playlist_app/models/video_image/video_image.dart';

part 'snippet.g.dart';

@JsonSerializable()
class Snippet {
  final String title;
  final String description;
  final Resource resourceId;
  @JsonKey(name: "thumbnails")
  final VideoImage videoImage;
  const Snippet({
    required this.title,
    required this.description,
    required this.resourceId,
    required this.videoImage,
  });

  factory Snippet.fromJson(Map<String, dynamic> data) =>
      _$SnippetFromJson(data);

  Map<String, dynamic> toJson() => _$SnippetToJson(this);
}
