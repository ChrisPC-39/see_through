import 'dart:io';

import 'package:flutter/material.dart';

class CustomFileImage extends StatefulWidget {
  final File? file;

  const CustomFileImage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  State<CustomFileImage> createState() => _CustomFileImageState();
}

class _CustomFileImageState extends State<CustomFileImage>
    with TickerProviderStateMixin {
  double _sliderVal = 100;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(milliseconds: 0), vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopupMenu(context),
      // onSecondaryTap: () => controller.reverse(),
      child: Image.file(
        widget.file!,
        opacity: CurvedAnimation(parent: controller, curve: Curves.linear),
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
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Slider(
                value: _sliderVal,
                min: 0,
                max: 100,
                onChanged: (newVal) => setState(() {
                  controller.animateTo(newVal / 100);
                  _sliderVal = newVal;
                }),
              );
            },
          ),
          value: "imageResize",
        ),
      ],
    );
  }
}
