part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  final PostStatus status;
  final List<VideoObject> videos;
  final bool isLoaded;
  final bool isCompleteLoaded;
  const HomeScreenState({
    this.status = PostStatus.normal,
    required this.videos,
    this.isLoaded = false,
    this.isCompleteLoaded = false,
  });

  HomeScreenState copyWith({
    PostStatus? status,
    List<VideoObject>? videos,
    bool? isLoaded,
    bool? isCompleteLoaded,
  }) =>
      HomeScreenState(
        status: status ?? this.status,
        videos: videos ?? this.videos,
        isLoaded: isLoaded ?? this.isLoaded,
        isCompleteLoaded: isCompleteLoaded ?? this.isCompleteLoaded,
      );

  @override
  List<Object> get props => [status, videos, isLoaded, isCompleteLoaded];
}
