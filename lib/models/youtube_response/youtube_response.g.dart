// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YouTubeResponse _$YouTubeResponseFromJson(Map<String, dynamic> json) {
  return YouTubeResponse(
    nextPageToken: json['nextPageToken'] as String?,
    pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => VideoItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$YouTubeResponseToJson(YouTubeResponse instance) =>
    <String, dynamic>{
      'nextPageToken': instance.nextPageToken,
      'pageInfo': instance.pageInfo,
      // 'items': instance.items,
    };
