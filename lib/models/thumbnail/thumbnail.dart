import 'package:json_annotation/json_annotation.dart';
part 'thumbnail.g.dart';

@JsonSerializable()
class Thumbnail {
  final String url;
  final int width;
  final int height;

  const Thumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> data) =>
      _$ThumbnailFromJson(data);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}
