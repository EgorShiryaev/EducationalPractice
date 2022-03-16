import 'dart:developer';
import 'dart:io';
import 'package:task_5/interface.dart';

class Game implements Interface {
  late List<String> _input;
  List<String> _result = [];

  late int _number;
  late List<List<int>> _matrix;
  late List<int> _null;

  @override
  setInput(List<String> input) {
    _input = input;
  }

  @override
  process() {
    _number = int.parse(_input[0]);
    _createMatrix();
    while (!_check()) {
      _print();
      _control();
    }
  }

  _createMatrix() {
    List<List<String>> _inputMatrix = [];
    _matrix = [];

    for (var i = 0; i < _number; i++) {
      _inputMatrix.add([]);
      _inputMatrix[i].addAll(_input[1 + i].split(' '));
      _matrix.add([]);
    }
    for (var i = 0; i < _number; i++) {
      for (var j = 0; j < _number; j++) {
        _matrix[i].add(int.parse(_inputMatrix[i][j]));
        if (_matrix[i][j] == 0) {
          _null = [i, j];
        }
      }
    }
  }

  _check() {
    for (var i = 0; i < _number; i++) {
      for (var j = 0; j < _number; j++) {
        if (_matrix[i][j] != i * _number + j + 1) {
          if (!(i == _number - 1 && j == _number - 1 && _matrix[i][j] == 0)) {
            return false;
          }
        }
      }
    }
    return true;
  }

  _print() {
    _matrix.forEach((output) {
      log(output.join(''));
    });
  }

  _control(){
    var line = stdin.readLineSync();
      switch (line) {
        case 'w':
          _swap(_null[0] + 1, _null[1]);
          break;
        case 's':
          _swap(_null[0] - 1, _null[1]);
          break;
        case 'a':
          _swap(_null[0], _null[1] - 1);
          break;
        case 'd':
          _swap(_null[0], _null[1] + 1);
          break;
      }
  }

  _swap(int x, int y) {
    _matrix[_null[0]][_null[1]] = _matrix[x][y];
    _matrix[x][y] = 0;
    _null = [x, y];
    _result.add('$x $y');
  }

  @override
  getResult() {
    return _result;
  }
}