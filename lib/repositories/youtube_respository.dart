import 'package:dio/dio.dart';
import 'package:youtube_playlist_app/data/singletons/dio_settings.dart';
import 'package:youtube_playlist_app/data/utils/config.dart';
import 'package:youtube_playlist_app/data/utils/service_locator.dart';
import 'package:youtube_playlist_app/models/youtube_response/youtube_response.dart';

var locator = serviceLocator<DioSettings>();

class YouTubeRepository {
  Future<YouTubeResponse> getPlayListVideos({String? token}) async {
    Dio _dio = Dio(locator.dioBaseOptions);
    print("playlistItems/");

    String fields =
        "nextPageToken, pageInfo, items/snippet(title, videoOwnerChannelId,description, videoOwnerChannelTitle, thumbnails(medium), resourceId(videoId))";

    final Response response = await _dio.get(
      "playlistItems/",
      queryParameters: {
        'part': "snippet",
        'playlistId': AppConfig.playlistId,
        'key': AppConfig.key,
        'fields': fields,
        'maxResults': AppConfig.maxResults,
        'pageToken': token,
      },
    );
    print(response.data);
    print(response.statusCode);

    YouTubeResponse youTubeResponse = YouTubeResponse.fromJson(response.data);

    return youTubeResponse;
  }
}

/*
curl \
  'https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=5&playlistId=PLzvqHA75DQGXMbqmJ1zJevMwMhb_il6Va&fields=nextPageToken%2C%20pageInfo%2C%20items%2Fsnippet(title%2C%20videoOwnerChannelId%2Cdescription%2C%20videoOwnerChannelTitle%2C%20thumbnails(medium)%2C%20resourceId(videoId))&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed

 */
