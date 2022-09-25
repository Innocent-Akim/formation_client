import 'package:flutter/material.dart';
import 'package:formation_client/constants.dart';
import 'package:formation_client/response/responsive.dart';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';

class Loarding extends StatefulWidget {
  final data;

  const Loarding({Key key, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StateBody();
  }
}

class _StateBody extends State<Loarding> {
  VideoPlayerController _controller;
  Duration _durationPosition;
  Duration _durationLength;
  double volume = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.data.filename)
      ..addListener(() {
        setState(() {
          _durationPosition = _controller.value.position;
        });
      })
      ..initialize().then((value) {
        setState(() {
          _durationLength = _controller.value.duration;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String getConverteTime(Duration duration) {
    final parstminute = duration.inMinutes % 60;
    final minute =
        parstminute < 10 ? "0${parstminute}" : parstminute.toString();
    final secondePast = duration.inSeconds % 60;
    final second = secondePast < 10 ? '0$secondePast' : secondePast.toString();

    return "$minute:$second";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              if (_controller.value.isInitialized) ...[
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  padding: EdgeInsets.all(8),
                )
              ],
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  Text(
                    "${getConverteTime(_durationPosition)} / ${getConverteTime(_durationLength)}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(Icons.volume_mute),
                  Slider(
                      min: 0,
                      max: 1,
                      value: volume,
                      onChanged: (_volume) {
                        setState(() {
                          volume = _volume;
                          _controller.setVolume(_volume);
                        });
                      }),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.setLooping(!_controller.value.isLooping);
                      });
                    },
                    icon: Icon(Icons.loop_outlined),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.data.title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${widget.data.resume}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
