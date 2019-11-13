
import 'package:workshop/model/artist.dart';

class Album {
  final String id;
  final String name;
  final String releaseDate;
  final int totalTracks;
  final String uri;
  final List<Image> images;
  final List<Artist> artists;

  Album({this.id, this.name, this.releaseDate, this.totalTracks, this.uri, this.images, this.artists});

  factory Album.fromJson(Map<String, dynamic> map) {
    return Album(
      id: map["id"],
      name: map["name"],
      releaseDate: map["release_date"],
      totalTracks: map["total_tracks"],
      uri: map["uri"],
      images: Image.fromList(map["images"]),
      artists: Artist.fromList(map["artists"]),
    );
  }


  static List<Album> fromList(Map<String, dynamic> map) {
    List<dynamic> records = map["items"];
    List<Album> albums = <Album>[];
    for (Map<String, dynamic> record in records) {
      albums.add(Album.fromJson(record));
    }
    return albums;
  }
}

class Image {
  final String url;
  final int height;
  final int width;

  Image({this.url, this.height, this.width});

  factory Image.fromJson(Map<String, dynamic> map) {
    return Image(url: map["url"], height: map["height"], width: map["width"]);
  }

  static List<Image> fromList(records) {
    List<Image> images = <Image>[];
    for (Map<String, dynamic> record in records) {
      images.add(Image.fromJson(record));
    }
    return images;
  }
}