import 'package:flutter/material.dart';

class NeumorphismDark extends StatelessWidget {
  String text;
  double height;
  double width;
  NeumorphismDark(this.text, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                ),
                BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(-4, -4),
                    blurRadius: 15),
              ],
            ),
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
        ],
      ),
    );
  }
}
