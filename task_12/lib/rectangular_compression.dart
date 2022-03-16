import 'dart:developer';

class RectangularCompression {
  List<List<int>> _matrix = [];

  RectangularCompression(List<String> input) {
    _readInputContent(input);
  }

  _readInputContent(List<String> input) {
    int height = int.parse(input[0].split(' ')[0]);
    int width = int.parse(input[0].split(' ')[1]);
    input = input.sublist(1);
    for (var i = 0; i < height; i++) {
      _matrix.add([]);
      for (var j = 0; j < width; j++) {
        _matrix[i].add(int.parse(input[i][j]));
      }
    }
  }

  findResult() {
    List<String> result = [];
    for (var i = 0; i < _matrix.length; i++) {
      final line = _matrix[i];
      for (var j = 0; j < line.length; j++) {
        final element = line[j];
        if (element != 2) {
          result.add(_createSquare(i, j));
        }
      }
    }
    log(_matrix.map((e) => e.join('')).toList().join('\n'));
    return '${result.length}\n' + result.join('\n');
  }

  _createSquare(int startI, int startJ) {
    int endI = startI;
    int endJ = startJ;
    final oppositeElement = (_matrix[startI][startJ] - 1).abs();
    final line = _matrix[startI];
    while (!(line.sublist(startJ, endJ + 2 > line.length ? line.length : endJ + 2).contains(oppositeElement))) {
      if (endJ == line.length - 1) {
        break;
      }
      endJ++;
    }

    while (!(_matrix[endI + 1 == _matrix.length ? endI : endI + 1].sublist(startJ, endJ).contains(oppositeElement))) {
      if (endI == _matrix.length - 1) {
        break;
      }
      endI++;
    }
    _fillSquare(startI, endI, startJ, endJ);
    return '$startI $startJ $endI $endJ';
  }

  _fillSquare(int startI, int endI, int startJ, int endJ) {
    for (var i = startI; i <= endI; i++) {
      for (var j = startJ; j <= endJ; j++) {
        _matrix[i][j] = 2;
      }
    }
  }
}
