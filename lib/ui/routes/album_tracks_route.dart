

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workshop/model/album.dart';
import 'package:workshop/model/track.dart';
import 'package:workshop/ui/routes/tracks_route.dart';

class AlbumTracksRoute extends StatelessWidget {

  final List<Track> tracks;
  final Album album;

  const AlbumTracksRoute({Key key, this.tracks, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        title: Text(album.name),
      ),
      body: TracksRoute(albumTracks: tracks)
    );
  }

}