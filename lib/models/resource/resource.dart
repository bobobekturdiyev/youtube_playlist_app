import 'package:json_annotation/json_annotation.dart';

part 'resource.g.dart';

@JsonSerializable()
class Resource {
  final String videoId;
  const Resource({
    required this.videoId,
  });

  factory Resource.fromJson(Map<String, dynamic> data) =>
      _$ResourceFromJson(data);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
