import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_client/app/addParticipant/participant_bloc.dart';
import 'package:formation_client/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
  String extension;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PdfViewerController pdfViewerController;
  OverlayEntry _overlayEntry;
  ParticipantBloc bloc;

  @override
  void initState() {
    super.initState();

    init();
    pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void init() {
    extension = widget.data.filename.toString().split(".").last;
    if (extension == 'mp4' || extension == 'avi') {
      _controller = VideoPlayerController.network(widget.data.filename)
        ..addListener(() {
          setState(() {
            _durationPosition = _controller.value.position ?? 00;
          });
        })
        ..initialize().then((value) {
          setState(() {
            _durationLength = _controller.value.duration ?? 00;
          });
        }).catchError((onError) => {print("${onError}")});
    }
  }

  String getConverteTime(Duration duration) {
    final parstminute = (duration.inMinutes ?? 00 % 60);
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              setState(() {
                _pdfViewerKey.currentState?.openBookmarkView();
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
              semanticLabel: 'Next',
            ),
            onPressed: () {
              setState(() {
                pdfViewerController.nextPage();
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.red,
              semanticLabel: 'Prev',
            ),
            onPressed: () {
              setState(() {
                pdfViewerController.previousPage();
              });
            },
          ),
        ],
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
          child: extension == 'mp4'
              ? Column(
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
                              _controller
                                  .setLooping(!_controller.value.isLooping);
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
                )
              : extension == 'png'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.data.filename == null
                            ? Image.asset(
                                "assets/images/react.png",
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "${widget.data.filename}",
                                fit: BoxFit.cover,
                              )
                      ],
                    )
                  : Container(
                      color: bgColor,
                      child: SfPdfViewer.network(
                        '${widget.data.filename}',
                        key: _pdfViewerKey,
                        initialZoomLevel: 1,
                        controller: pdfViewerController,
                        initialScrollOffset: Offset(0, 500),
                        // pageSpacing: 2,
                        enableTextSelection: false,
                        onTextSelectionChanged:
                            (PdfTextSelectionChangedDetails details) {
                          if (details.selectedText != null) {
                            print(details.selectedText);
                          }
                        },
                        onDocumentLoaded: (val) {
                          print("Loading... OK... ${val.document}");
                        },
                      ),
                    ),
        ),
      ),
    );
  }
}
