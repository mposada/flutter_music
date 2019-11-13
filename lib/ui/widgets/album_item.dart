
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workshop/model/album.dart';
import 'package:workshop/ui/widgets/album_image_widget.dart';
import 'package:workshop/ui/widgets/play_button_widget.dart';

class AlbumItem extends StatelessWidget {

  final Album album;

  const AlbumItem({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenAwareSize = MediaQuery.of(context).size.width * 0.44;

    return Container(
      margin: EdgeInsets.all(8.0),
      width: screenAwareSize,
      height: 226.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: screenAwareSize,
            height: 190.0,
            child: Stack(
              children: <Widget>[
                AlbumImageWidget(
                  width: screenAwareSize,
                  height: screenAwareSize,
                  assetUrl: album.images[1].url, // size 64
                ),
                Container(
                  alignment: Alignment(0.80, 0.80),
                  child: PlayButtonWidget()
                )
              ],
            ),
          ),
          Container(
            height: 23.0, // delete this to enable wrapping
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 2.0, top: 4.0, left: 4.0),
            child: Text(
              album.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, letterSpacing: 1.0)
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 5.0),
            child: Text(album.artists.first.name, style: TextStyle(color: Colors.grey, fontSize: 16.0))
          ),
        ],
      ),
    );
  }

}