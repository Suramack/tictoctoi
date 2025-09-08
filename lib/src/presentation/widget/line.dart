import 'package:flutter/material.dart';
import 'package:tictoctoi/src/presentation/widget/box.dart';

class Line extends StatelessWidget {
  final int v1, v2, v3;
  final Function v1OnTap, v2OnTap, v3OnTap;
  const Line({
    super.key,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.v1OnTap,
    required this.v2OnTap,
    required this.v3OnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Box(value: v1, onTap: v1OnTap),
        Box(value: v2, onTap: v2OnTap),
        Box(value: v3, onTap: v3OnTap),
      ],
    );
  }
}
