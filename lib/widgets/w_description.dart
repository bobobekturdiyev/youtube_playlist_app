import 'package:flutter/material.dart';
import 'package:youtube_playlist_app/data/utils/colors.dart';
import 'package:youtube_playlist_app/data/utils/fonts.dart';

class WDescription extends StatelessWidget {
  final String description;
  const WDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: MyColors.bottomLine,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Text(
                description,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 16,
                  fontFamily: MyFonts.regular,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
