
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop/model/track.dart';
import 'package:workshop/music_repository.dart';
import 'package:workshop/ui/widgets/track_item.dart';

class TracksRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TracksState();
}

class TracksState extends State<TracksRoute> {

  AudioPlayer audioPlayer = AudioPlayer();
  List<Track> _tracks = <Track>[];
  Track _selectedTrack;
  String _errorMessage = "";
  double _controlsContainerHeight = 0.0;
  double _audioPosition = 0.0;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    MusicRepository.getTracks().then((response) {
      if (response is List<Track>) {
        setState(() => _tracks.addAll(response));
      } else {
        setState(() => _errorMessage = response);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return _errorMessage.isEmpty ?
    Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 16.0),
        child: _tracks.length > 0 ? ListView.builder(
            itemCount: _tracks.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () => _playSong(index),
                  child: TrackItem(track: _tracks[index])
              );
            }
        ): Center(child: CircularProgressIndicator()),
      ),
      _selectedTrack != null ? playerWidget() : Container()
    ]) :
    Center(child: Text(_errorMessage));
  }

  Widget playerWidget() {
    return Align(
      alignment: Alignment(0.0, 1.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: Colors.white,
        width: double.infinity,
        height: _controlsContainerHeight,
        curve: Curves.fastOutSlowIn,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LinearProgressIndicator(
              value: _audioPosition.toDouble(),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 7.0),
                  child: ClipRRect(
                    child: Image.network(_selectedTrack.albums.images.first.url, width: 45.0, height: 45.0,),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(left: 12.0, top: 7.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("PLAYING", style: TextStyle(color: Colors.grey, fontSize: 14.0, letterSpacing: 1.0)),
                        Text(
                          _selectedTrack.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, letterSpacing: 1.0)
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 45.0,
                    height: 45.0,
                    margin: EdgeInsets.only(right: 16.0, top: 7.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                    child: IconButton(
                        iconSize: 25.0,
                        color: Colors.white,
                        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () => _pauseOrResume()
                    )
                )
              ]
            ),
          ],
        ),
      ),
    );
  }

  void _playSong(int index) async {
    setState(() {
      _selectedTrack = _tracks[index];
      _controlsContainerHeight = 70.0;
      _isPlaying = true;
    });
    int result = await audioPlayer.play(_selectedTrack.previewUrl);
    if (result == 1) {
      audioPlayer.onAudioPositionChanged.listen((Duration position) {
        print('Current position: ${position.inSeconds}');
        setState(() => _audioPosition = position.inMilliseconds / 30000);
      });
    }
  }

  void _pauseOrResume() async {
    if (_isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.resume();
    }

    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  void dispose() {
    super.dispose();

    audioPlayer.dispose();
  }

}