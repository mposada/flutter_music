

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workshop/model/album.dart';
import 'package:workshop/music_repository.dart';
import 'package:workshop/ui/widgets/album_item.dart';

class AlbumsRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AlbumsState();

}

class AlbumsState extends State<AlbumsRoute> {

  List<Album> _albums = <Album>[];
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();

    MusicRepository.getAlbums().then((response) {
      if (response is List<Album>) {
        setState(() => _albums.addAll(response));
      } else {
        setState(() => _errorMessage = response);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenAwareSize = MediaQuery.of(context).size.width * 0.44;
    final albumItemHeight = 226.0;

    final aspectRatio = screenAwareSize / albumItemHeight;

    return _errorMessage.isEmpty ? Container(
      margin: EdgeInsets.only(top: 12.0),
        child: _albums.length > 0 ? GridView.builder(
            itemCount: _albums.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (context, position) {
              return AlbumItem(album: _albums[position]);
            }
        ) : Center(child: CircularProgressIndicator())
    ) : Center(child: Text(_errorMessage));
  }

}