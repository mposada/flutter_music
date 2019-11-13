
import 'package:workshop/model/album.dart';
import 'package:workshop/model/artist.dart';

class Track {
  final String id;
  final String name;
  final String uri;
  final int durationMs;
  final String previewUrl;
  final Album albums;
  final List<Artist> artists;

  Track({this.id, this.name, this.uri, this.durationMs, this.previewUrl, this.albums, this.artists});

  factory Track.fromJson(Map<String, dynamic> map) {
    return Track(
      id: map["id"],
      name: map["name"],
      uri: map["uri"],
      durationMs: map["duration_ms"],
      previewUrl: map["preview_url"] ?? "",
      albums: Album.fromJson(map["album"]),
      artists: Artist.fromList(map["artists"]),
    );
  }

  static List<Track> fromList(Map<String, dynamic> map) {
    List<dynamic> items = map["items"];
    List<Track> tracks = <Track>[];
    for (Map<String, dynamic> item in items) {
      Map<String, dynamic> track = item["track"];
      tracks.add(Track.fromJson(track));
    }
    return tracks;
  }
}