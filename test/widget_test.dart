
import 'package:flutter_test/flutter_test.dart';
import 'package:workshop/model/album.dart';
import 'package:workshop/model/track.dart';
import 'package:workshop/music_repository.dart';

void main() {
  test("album endpoint", () async {
    final albums = await MusicRepository.getAlbums();
    expect(albums, isInstanceOf<List<Album>>());
  });

  test("tracks endpoint", () async {
    final tracks = await MusicRepository.getTracks();
    expect(tracks, isInstanceOf<List<Track>>());
  });
}
