import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_playlist_app/data/utils/colors.dart';
import 'package:youtube_playlist_app/data/utils/fonts.dart';
import 'package:youtube_playlist_app/models/status/post_status.dart';
import 'package:youtube_playlist_app/models/video_object/video_object.dart';
import 'package:youtube_playlist_app/widgets/w_description.dart';
import 'package:youtube_playlist_app/widgets/w_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _controller;
  ScrollController _scrollController = ScrollController();

  void runYouTubePlayer(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        enableCaption: false,
        isLive: false,
        forceHD: true,
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  bool isControllerInitialized = false;
  late VideoObject videoObject;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (!state.isLoaded) {
          return CupertinoActivityIndicator();
        } else if (state.isLoaded && !isControllerInitialized) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            videoObject = state.videos[0];

            runYouTubePlayer(videoObject.videoId);
            setState(() {
              isControllerInitialized = true;
            });
          });

          return CupertinoActivityIndicator();
        } else {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              progressColors: ProgressBarColors(
                backgroundColor: MyColors.primaryColor.withOpacity(0.8),
                bufferedColor: MyColors.white.withOpacity(0.4),
                handleColor: MyColors.primaryColor,
                playedColor: MyColors.primaryColor,
              ),
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) => SafeArea(
              child: Scaffold(
                backgroundColor: MyColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "You",
                              style: TextStyle(
                                color: MyColors.red,
                                fontSize: 22,
                                fontFamily: MyFonts.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Tube Playlist App",
                              style: TextStyle(
                                color: MyColors.white,
                                fontSize: 22,
                                fontFamily: MyFonts.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.cardColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24.0),
                            ),
                          ),
                          child: player,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          if (videoObject.description.trim().isNotEmpty) {
                            showModalBottomSheet(
                              backgroundColor: MyColors.transparent,
                              context: context,
                              builder: (context) => WDescription(
                                description: videoObject.description,
                              ),
                            );
                          }
                        },
                        splashColor: MyColors.primaryColor.withOpacity(0.2),
                        highlightColor: MyColors.primaryColor.withOpacity(0.1),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                videoObject.title,
                                style: TextStyle(
                                  color: MyColors.white,
                                  fontSize: 18,
                                  fontFamily: MyFonts.semiBold,
                                  height: 1.6,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (videoObject.description.trim().isNotEmpty) ...{
                              Icon(
                                Icons.arrow_drop_down,
                                color: MyColors.primaryColor,
                                size: 32,
                              ),
                            },
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: MyColors.divider,
                      ),
                      Container(
                        child: Flexible(
                          child: ListView.builder(
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(
                                bottom: (index == (state.videos.length - 1) &&
                                        !state.isCompleteLoaded)
                                    ? 50.0
                                    : 0,
                              ),
                              child: WItem(
                                image: state.videos[index].image,
                                title: state.videos[index].title,
                                isActive: videoObject.videoId ==
                                    state.videos[index].videoId,
                                onTap: () {
                                  if (videoObject.videoId !=
                                      state.videos[index].videoId) {
                                    _controller.pause();
                                    setState(() {
                                      videoObject = state.videos[index];
                                      _controller.load(videoObject.videoId);
                                    });
                                  }
                                },
                              ),
                            ),
                            itemCount: state.videos.length,
                          ),
                        ),
                      ),
                      if (state.status == PostStatus.loading) ...{
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          color: MyColors.background,
                          child: Column(
                            children: [
                              CupertinoActivityIndicator(),
                            ],
                          ),
                        ),
                      },
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _getMoreData() {
    if (!context.read<HomeScreenBloc>().isCompleteLoaded) {
      context.read<HomeScreenBloc>().add(LoadList());
    }
  }
}
