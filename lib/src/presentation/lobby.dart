import 'package:flutter/material.dart';
import 'package:tictoctoi/src/presentation/widget/alert_dialog.dart';
import 'package:tictoctoi/src/presentation/widget/line.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  bool isClicked = true;
  // bool won = false;

  static final ValueNotifier<bool> won = ValueNotifier<bool>(false);

  List<List<int>> list = [
    [9, 9, 9],
    [9, 9, 9],
    [9, 9, 9],
  ];

  void v1OnTap(int i, int j) {
    if (won.value) return;

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
    checkWinner();
  }

  void checkWinner() {
    // Row Wise
    for (int i = 0; i < 3; i++) {
      if (list[i].toSet().length == 1 &&
          (list[i].first == 0 || list[i].first == 1)) {
        won.value = true;
        print('Winner row');
        return;
      }
    }

    // Column Wise
    for (int col = 0; col < 3; col++) {
      var column = [for (int row = 0; row < 3; row++) list[row][col]];
      if (column.toSet().length == 1 &&
          (column.first == 0 || column.first == 1)) {
        won.value = true;
        print('Winner column');
        return;
      }
    }

    //diagonal check

    List<int> temp = [];
    for (int i = 0; i < 3; i++) {
      temp.add(list[i][i]);
    }
    if (temp.toSet().length == 1 && (temp.first == 0 || temp.first == 1)) {
      won.value = true;
      print('Winner diagonal');
      return;
    }

    var antiDiagonal = [for (int i = 0; i < 3; i++) list[i][3 - i - 1]];

    if (antiDiagonal.toSet().length == 1 &&
        (antiDiagonal.first == 0 || antiDiagonal.first == 1)) {
      won.value = true;
      print('Winner anti-diagonal');
      return;
    }
    if (list.map((e) => e.contains(9)).isEmpty) {
      print('draw');
    }
  }

  void restart() {
    list = [
      [9, 9, 9],
      [9, 9, 9],
      [9, 9, 9],
    ];
    won.value = false;
    setState(() {});
  }

  listnenWinner() {
    won.addListener(() {
      print('lister');
      resultDialog(title: 'WON', context: context);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listnenWinner();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                restart();
              },
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
