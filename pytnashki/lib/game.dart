import 'dart:developer';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> result = [];
  List<List<int>> matrix = [
    [14, 13, 23, 15, 38, 50, 11, 61],
    [59, 22, 18, 6, 2, 1, 57, 30],
    [26, 34, 0, 58, 27, 40, 19, 54],
    [53, 35, 60, 24, 21, 4, 10, 39],
    [3, 33, 25, 5, 28, 29, 45, 43],
    [56, 44, 55, 51, 12, 16, 9, 17],
    [48, 41, 49, 8, 63, 52, 31, 47],
    [46, 37, 20, 36, 62, 7, 32, 42],
  ];
  int n = 8;
  List<int> _null = [2, 2];
  @override
  void initState() {
    _createMatrix();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String tablo = '';
    for (var output in matrix) {
      String outputArray = output.toString();
      outputArray = outputArray.replaceAll(',', '');
      outputArray = outputArray.replaceFirst('[', '');
      outputArray = outputArray.replaceFirst(']', '');
      tablo += outputArray + '\n';
    }
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(n, (i) {
              return Column(
                  children: List<Widget>.generate(n, (j) {
                return Container(
                  margin: EdgeInsets.all(7.5),
                  child: Text(
                    matrix[j][i].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: matrix[j][i] == 0 ? FontWeight.w900 : null),
                  ),
                );
              }));
            }),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _swap(_null[0] - 1, _null[1]);
                  });
                },
                icon: const Icon(Icons.arrow_upward),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _swap(_null[0], _null[1] - 1);
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_left),
                  ),
                  IconButton(
                    onPressed: () {
                      _addResult();
                    },
                    icon: const Icon(Icons.add_to_home_screen_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _swap(_null[0], _null[1] + 1);
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _swap(_null[0] + 1, _null[1]);
                  });
                },
                icon: const Icon(Icons.arrow_downward),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _createMatrix() {}

  _swap(int x, int y) {
    matrix[_null[0]][_null[1]] = matrix[x][y];
    matrix[x][y] = 0;
    _null = [x, y];
    result.add('${x + 1} ${y + 1}');
  }

  _addResult() {
    _makeCorrectOutput();
  }

  _makeCorrectOutput() {
    log('${result.length}');
    for (var i = 0; i < (result.length / 1500).floor(); i++) {
      String output = '';
      for (var j = 0; j < 1500; j++) {
        output += result[i * 1500 + j] + ',';
      }
      log(output);
    }
    String output = '';
    for (var i = 0; i < result.length - 1500 * (result.length / 1500).floor(); i++) {
      output += result[(result.length / 1500).floor() * 1500 + i] + ',';
    }
    log(output);
  }
}
