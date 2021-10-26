import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_playlist_app/models/snippet/snippet.dart';

part 'video_item.g.dart';

@JsonSerializable()
class VideoItem {
  @JsonKey(name: "snippet")
  final Snippet videoItem;
  const VideoItem({
    required this.videoItem,
  });

  factory VideoItem.fromJson(Map<String, dynamic> data) =>
      _$VideoItemFromJson(data);

  Map<String, dynamic> toJson() => _$VideoItemToJson(this);
}
