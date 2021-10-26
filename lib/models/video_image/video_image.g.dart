// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoImage _$VideoImageFromJson(Map<String, dynamic> json) {
  return VideoImage(
    thumbnail: Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoImageToJson(VideoImage instance) =>
    <String, dynamic>{
      'medium': instance.thumbnail,
    };
