import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class LocalFile extends StatefulWidget {
  final File? file;
  final bool isVideo;

  const LocalFile({
    Key? key,
    required this.file,
    required this.isVideo,
  }) : super(key: key);

  @override
  State<LocalFile> createState() => _LocalFileState();
}

class _LocalFileState extends State<LocalFile>
    with TickerProviderStateMixin {
  double _sliderVal = 100;
  bool _isClick = false;

  late AnimationController controller;

  Player player = Player(id: 1);
  late Media video;

  @override
  void initState() {
    super.initState();

    if (widget.isVideo) {
      video = Media.file(widget.file!);
      player.open(video);
    }

    controller = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    controller.forward();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isClick = !_isClick),
      onDoubleTap: () => setState(() => _isClick = !_isClick),
      child: Stack(
        children: [
          widget.isVideo
              ? AnimatedOpacity(
                  duration: const Duration(seconds: 0),
                  opacity: _sliderVal / 100,
                  child: Video(
                    player: player,
                    width: 1080,
                    height: 1920,
                    showControls: true,
                  ),
                )
              : Image.file(
                  widget.file!,
                  opacity: CurvedAnimation(
                    parent: controller,
                    curve: Curves.linear,
                  ),
                ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _isClick ? 1 : 0,
            child: SizedBox(
              width: 200,
              height: 100,
              child: Slider(
                value: _sliderVal,
                min: 0,
                max: 100,
                onChanged: (newVal) => setState(() {
                  controller.animateTo(newVal / 100);
                  _sliderVal = newVal;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    final offset = overlay.localToGlobal(Offset.zero);
    final left = offset.dx;
    final top = offset.dy + overlay.size.height;
    final right = left + overlay.size.width;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[800],
      elevation: 8.0,
      items: [
        PopupMenuItem(
          child: Slider(
            value: _sliderVal,
            min: 0,
            max: 100,
            onChanged: (newVal) => setState(() {
              controller.animateTo(newVal / 100);
              _sliderVal = newVal;
            }),
          ),
          value: "imageResize",
        ),
      ],
    );
  }
}
