


import 'package:flutter/material.dart';
import 'package:workshop/model/track.dart';
import 'package:workshop/ui/widgets/album_image_widget.dart';

class TrackItem extends StatelessWidget {

  bool isPlaying;
  final Track track;

  TrackItem({Key key, this.isPlaying, this.track}): super(key: key) {
    this.isPlaying = isPlaying ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          track.albums.id != null ? Expanded(
            flex: 1,
            child: AlbumImageWidget(
              width: 60.0,
              height: 60.0,
              margins: EdgeInsets.only(right: 16.0),
              assetUrl: track.albums.images[1].url,
            )
          ) : Container(),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    track.name,
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  )
                ),
                Text(track.artists.first.name, style: TextStyle(fontSize: 17.0, color: Colors.grey))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: !isPlaying ? Text(
              "${track.previewUrl.isNotEmpty ? '✓' : ''} ${(track.durationMs / 60000).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
              textAlign: TextAlign.end,
            ) : Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.equalizer),
            )
          ),
        ],
      ),
    );
  }

}