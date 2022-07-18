import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/video/rounded_icon.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class _Constants {
  static const Offset shadowOffset = Offset(0, 4);
  static const double videoWidth = 143;
  static const double videoHeight = 123;
  static const double blurRadius = 19;
  static const double spreadRadius = 0;
  static const double borderRadius = 10;
  static const double iconSize = 48;
  static const double videoScale = 1.4;
}

class VideoTileWidget extends StatefulWidget {
  VideoTileWidget({
    Key? key,
    required this.videoId,
    required this.videoName,
  }) : super(key: key);

  final String videoId;
  final String videoName;

  @override
  _VideoTileWidgetState createState() => _VideoTileWidgetState();
}

class _VideoTileWidgetState extends State<VideoTileWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        hideControls: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _Constants.videoWidth,
          height: _Constants.videoHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF59422B).withAlpha(50),
                      offset: _Constants.shadowOffset,
                      blurRadius: _Constants.blurRadius,
                      spreadRadius: _Constants.spreadRadius,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(_Constants.borderRadius),
                clipBehavior: Clip.antiAlias,
                child: Transform.scale(
                  scale: _Constants.videoScale,
                  child: Container(
                    height: _Constants.videoHeight,
                    child: YoutubePlayer(controller: _controller),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(_Constants.borderRadius),
                ),
              ),
              RoundedIconButton(
                onPressed: () {
                  // TODO: refactor below
                  DIContainer.container.resolve<NavigationManager>().navigateTo(
                    'src/fullscreen_video',
                    NavigationType.push(),
                    arguments: {
                      'videoId': widget.videoId,
                    },
                  );
                },
                icon: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: _Constants.iconSize,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
        Container(
          width: _Constants.videoWidth,
          child: CrayonPaymentText(
            text: TextUIDataModel(
              widget.videoName,
              styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
