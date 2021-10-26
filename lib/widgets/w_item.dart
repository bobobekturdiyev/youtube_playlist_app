import 'package:flutter/material.dart';
import 'package:youtube_playlist_app/data/utils/colors.dart';
import 'package:youtube_playlist_app/data/utils/fonts.dart';

class WItem extends StatelessWidget {
  final String image;
  final String title;
  final GestureTapCallback onTap;
  final bool isActive;
  const WItem({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: isActive ? MyColors.activeCardColor : MyColors.cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              child: Image.network(
                image,
                width: 128,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 16,
                  fontFamily: MyFonts.regular,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
