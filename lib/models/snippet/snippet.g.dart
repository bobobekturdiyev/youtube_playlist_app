// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return Snippet(
    title: json['title'] as String,
    description: json['description'] as String,
    resourceId: Resource.fromJson(json['resourceId'] as Map<String, dynamic>),
    videoImage: VideoImage.fromJson(json['thumbnails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SnippetToJson(Snippet instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'resourceId': instance.resourceId,
      'thumbnails': instance.videoImage,
    };
