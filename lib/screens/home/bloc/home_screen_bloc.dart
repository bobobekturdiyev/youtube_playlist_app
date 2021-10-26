import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_playlist_app/models/status/post_status.dart';
import 'package:youtube_playlist_app/models/video_object/video_object.dart';
import 'package:youtube_playlist_app/models/youtube_response/youtube_response.dart';
import 'package:youtube_playlist_app/repositories/youtube_respository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState(videos: [])) {
    on<LoadList>(_loadList);
    add(LoadList());
    youTubeRepository = YouTubeRepository();
  }

  late YouTubeRepository youTubeRepository;
  String? pageToken;
  bool isCompleteLoaded = false;

  List<String> videoIds = [];
  List<VideoObject> videos = [];
  Future<void> _loadList(LoadList event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));

    try {
      YouTubeResponse youTubeResponse =
          await youTubeRepository.getPlayListVideos(token: pageToken);
      pageToken = youTubeResponse.nextPageToken;
      if (youTubeResponse.items.length > 0) {
        for (int i = 0; i < youTubeResponse.items.length; i++) {
          videoIds.add(youTubeResponse.items[i].videoItem.resourceId.videoId);
          videos.add(
            VideoObject(
              videoId: youTubeResponse.items[i].videoItem.resourceId.videoId,
              image:
                  youTubeResponse.items[i].videoItem.videoImage.thumbnail.url,
              title: youTubeResponse.items[i].videoItem.title,
              description: youTubeResponse.items[i].videoItem.description,
            ),
          );
        }
      }

      if (pageToken == null && videos.isNotEmpty) {
        isCompleteLoaded = true;
      }

      emit(
        state.copyWith(
          status: PostStatus.loaded,
          videos: videos,
          isLoaded: true,
          isCompleteLoaded: isCompleteLoaded,
        ),
      );
    } catch (exception) {
      print(exception.toString());
    }
  }
}
