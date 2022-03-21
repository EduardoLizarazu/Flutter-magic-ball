import 'package:flutter/material.dart';

class NeumorphismLight extends StatelessWidget {
  String text;
  double height;
  double width;
  NeumorphismLight(this.text, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                ),
                const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15),
              ]),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              shadows: [
                const Shadow(
                    offset: Offset(3, 3),
                    color: Colors.black38,
                    blurRadius: 10),
                Shadow(
                    offset: const Offset(-3, -3),
                    color: Colors.white.withOpacity(0.85),
                    blurRadius: 10)
              ]),
        ),
      ]),
    );
  }
}
