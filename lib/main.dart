import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_playlist_app/data/utils/colors.dart';
import 'package:youtube_playlist_app/screens/home/bloc/home_screen_bloc.dart';
import 'package:youtube_playlist_app/screens/home/home_screen.dart';

import 'data/utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: MyColors.primaryColor,
        ),
        title: 'Flutter Demo',
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
