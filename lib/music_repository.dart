
import 'package:http/http.dart' as client;
import 'dart:convert' as convert;

import 'package:workshop/model/album.dart';
import 'package:workshop/model/track.dart';

class MusicRepository {
  static final String baseUrl = "https://api.spotify.com/v1";
  static final String browse = "browse/new-releases/?country=CO&limit=10";
  static final String tracks = "artists/{artist}/top-tracks?country=CO";
  static final String partyTracks = "playlists/37i9dQZF1DX1TEroFz7Oja/tracks";
  static final String postMalone = "246dkjvS1zLTtiykXe5h60";
  static final String token = "Bearer BQCB-08kjD0m45Ss6qcjZkhfe2HRA2oCzWVbeCLqvsd4TyS5aWdYmqsDgOOUhLeMNJdVr2aID8LwWAknEeM";

  static Future<dynamic> getAlbums() async {
    final response = await client.get("$baseUrl/$browse",
        headers: { "Authorization": token });
    Map<String, dynamic> map = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Album.fromList(map["albums"]);
    } else {
      return getErrorMessage(map);
    }
  }

  static Future<dynamic> getTracks({String artistId}) async {
    final url = artistId == null ? "$baseUrl/$partyTracks" : "$baseUrl/${tracks.replaceAll("{artist}", artistId)}";
    final response = await client.get(url, headers: { "Authorization": token });
    Map<String, dynamic> map = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Track.fromList(map);
    } else {
      return getErrorMessage(map);
    }
  }

  static String getErrorMessage(Map<String, dynamic> map) {
    Map<String, dynamic> errorMap = map["error"];
    String errorMessage = errorMap["message"];
    return errorMessage;
  }
}