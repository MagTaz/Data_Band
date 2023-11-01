import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({Key? key, required this.path, required this.color}) : super(key: key);
  
  final String path;
  final Color color;
  
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isAudioPlaying = false;

  @override
  void initState() {
    super.initState();

    
    
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    
    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Slider(
             activeColor: widget.color,
            inactiveColor: widget.color.withOpacity(0.5),
            min: 0,
            max: duration.inMilliseconds.toDouble(),
            value: position.inMilliseconds.toDouble(),
            onChanged: (value) {
              final position = Duration(milliseconds: value.toInt());
              setState(() {
                isAudioPlaying = false;
                _audioPlayer.pause();
                this.position = position;
              });
            },
            onChangeEnd: (value) async {
              final position = Duration(milliseconds: value.toInt());
              await _audioPlayer.seek(position);
              if (isAudioPlaying) {
                await _audioPlayer.resume();
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: widget.color,
            radius: 25,
            child: IconButton(
              icon: Icon(isAudioPlaying ? Icons.pause : Icons.play_arrow,color: Colors.white,),
              iconSize: 30,
              onPressed: () async {
                if (isAudioPlaying) {
                  setState(() {
                    isAudioPlaying = false;
                  });
                  
                  await _audioPlayer.pause();
                } else {
                  if (widget.path != "") {
                    setState(() {
                      isAudioPlaying = true;
                    });
                    
                     Source urlSource = UrlSource(widget.path); 
                    await _audioPlayer.play(urlSource);
                    
                  }
                }
              },
            ),
          ),
        SizedBox(height: 20,)
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    int minutes = duration.inMinutes;
    int remainingSeconds = duration.inSeconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }
}