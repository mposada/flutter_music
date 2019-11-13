
class Artist {
  final String id;
  final String name;
  final String type;
  final String uri;
  final String href;

  Artist({this.id, this.name, this.type, this.uri, this.href});

  factory Artist.fromJson(Map<String, dynamic> map) {
    return Artist(
      id: map["id"],
      name: map["name"],
      type: map["type"],
      uri: map["uri"],
      href: map["href"]
    );
  }

  static List<Artist> fromList(records) {
    List<Artist> artists = <Artist>[];
    for (Map<String, dynamic> record in records) {
      artists.add(Artist.fromJson(record));
    }
    return artists;
  }
}