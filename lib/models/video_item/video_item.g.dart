// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoItem _$VideoItemFromJson(Map<String, dynamic> json) {
  return VideoItem(
    videoItem: Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoItemToJson(VideoItem instance) => <String, dynamic>{
      'snippet': instance.videoItem,
    };
