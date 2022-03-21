import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        // Container(
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //           colors: [
        //             Color.fromARGB(127, 215, 216, 255),
        //             Color.fromARGB(255, 0, 0, 0)
        //           ],
        //           begin: FractionalOffset(0.2, 0.0),
        //           end: FractionalOffset(1.0, 0.6),
        //           stops: [0.0, 0.6],
        //           tileMode: TileMode.clamp)),
        //   alignment: Alignment(-0.9, -0.6),
        // );
        Container(
      // decoration: const BoxDecoration(color: Colors.black87),
      decoration: const BoxDecoration(color: Color.fromRGBO(33, 33, 33, 1)),
    );
  }
}
