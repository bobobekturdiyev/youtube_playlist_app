import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_playlist_app/models/thumbnail/thumbnail.dart';

part 'video_image.g.dart';

@JsonSerializable()
class VideoImage {
  @JsonKey(name: "medium")
  final Thumbnail thumbnail;
  const VideoImage({
    required this.thumbnail,
  });

  factory VideoImage.fromJson(Map<String, dynamic> data) =>
      _$VideoImageFromJson(data);

  Map<String, dynamic> toJson() => _$VideoImageToJson(this);
}
