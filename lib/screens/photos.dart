import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Photo",
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
