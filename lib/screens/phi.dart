import 'package:flutter/material.dart';

class Phi extends StatelessWidget {
  final Color color;

  const Phi({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 3 / 8,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: color,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 3 / 8,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: color,
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 1 / 3,
          child: Container(
            width: 2,
            height: MediaQuery.of(context).size.height,
            color: color,
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 1 / 3,
          child: Container(
            width: 2,
            height: MediaQuery.of(context).size.height,
            color: color,
          ),
        ),
      ],
    );
  }
}
