import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final FractionalOffset begin;
  final FractionalOffset end;

  const GradientWidget({super.key, required this.begin, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560.0,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: [Color(0xff1E1F27), Colors.black.withOpacity(0)],
              stops: [0.01, 0.5])),
    );
  }
}
