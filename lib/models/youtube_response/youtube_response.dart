import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_playlist_app/models/page_info/page_info.dart';
import 'package:youtube_playlist_app/models/video_item/video_item.dart';

part 'youtube_response.g.dart';

@JsonSerializable()
class YouTubeResponse {
  final String? nextPageToken;

  final PageInfo pageInfo;

  final List<VideoItem> items;

  const YouTubeResponse({
    this.nextPageToken = "",
    required this.pageInfo,
    required this.items,
  });

  factory YouTubeResponse.fromJson(Map<String, dynamic> data) =>
      _$YouTubeResponseFromJson(data);

  Map<String, dynamic> toJson() => _$YouTubeResponseToJson(this);
}
