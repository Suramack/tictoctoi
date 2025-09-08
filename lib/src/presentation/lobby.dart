import 'package:flutter/material.dart';
import 'package:tictoctoi/src/presentation/widget/line.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  bool isClicked = true;

  List<List<int>> list = [
    [9, 9, 9],
    [9, 9, 9],
    [9, 9, 9],
  ];

  void v1OnTap(int i, int j) {
    if (isClicked) {
      if (list[i][j] == 9) {
        list[i][j] = 0;
      } else {
        return;
      }
    } else {
      if (list[i][j] == 9) {
        list[i][j] = 1;
      } else {
        return;
      }
    }
    isClicked = !isClicked;
    setState(() {});
  }

  void restart() {
    list = [
      [9, 9, 9],
      [9, 9, 9],
      [9, 9, 9],
    ];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Line(
              v1: list[i][0],
              v2: list[i][1],
              v3: list[i][2],
              v1OnTap: () {
                //i0
                v1OnTap(i, 0);
              },
              v2OnTap: () {
                // i1
                v1OnTap(i, 1);
              },
              v3OnTap: () {
                // i2
                v1OnTap(i, 2);
              },
            ),

          ElevatedButton(
            onPressed: () {
              restart();
            },
            child: Text('Restart'),
          ),
        ],
      ),
    );
  }
}
