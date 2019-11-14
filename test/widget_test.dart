
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

  test("album tracks endpoint", () async {
    final tracks = await MusicRepository.getAlbumTracks(albumId: "0cm9LOQUBK3JUgyoRj238z");
    expect(tracks, isInstanceOf<List<Track>>());
  });
}
