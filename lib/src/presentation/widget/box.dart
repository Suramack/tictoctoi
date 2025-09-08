import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final int value;
  final Function onTap;
  const Box({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          width: 55,
          height: 55,
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: value == 9 ? Text('') : Text(value.toString()),
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
