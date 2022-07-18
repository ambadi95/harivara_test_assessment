import 'package:core/ioc/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/video/rounded_icon.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:core/navigation/navigation_manager.dart';

class FullScreenVideoPage extends StatefulWidget {
  static const viewPath = 'src/fullscreen_video';
  FullScreenVideoPage({Key? key, required this.videoId}) : super(key: key);

  final String videoId;

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(initialVideoId: widget.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        aspectRatio: 1 / MediaQuery.of(context).size.aspectRatio,
        onReady: _controller.toggleFullScreenMode,
        onEnded: (_) => exit(),
      ),
      builder: (context, player) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              player,
              Positioned(
                top: 0,
                right: 0,
                child: RoundedIconButton(
                  onPressed: exit,
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void exit() {
    // TODO: refactor below
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ).then((_) => DIContainer.container.resolve<NavigationManager>().goBack());
  }
}
