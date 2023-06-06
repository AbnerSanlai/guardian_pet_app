import 'package:flutter/material.dart';

class PetAppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appbar;

  const PetAppScaffold({Key? key, required this.body, this.appbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(20, 32, 168, 214),
              Color.fromARGB(80, 32, 168, 214),
              Color.fromARGB(100, 32, 168, 214),
              Color.fromARGB(120, 32, 168, 214),
              //add more colors for gradient
            ],
            transform: GradientRotation(0.5),
            begin: Alignment.centerLeft, //begin of the gradient color
            end: Alignment.bottomRight, //end of the gradient color
            stops: [0, 0.2, 0.5, 0.8], //stops for individual color
            //set the stops number equal to numbers of color
          ),
        ),
        child: body,
      ),
    );
  }
}
