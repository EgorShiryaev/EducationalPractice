import 'dart:io';

import 'package:task_8/plagin/interface.dart';

class Count implements Interface {
  late int _nRows;
  late int _nColumns;
  late List<List<int>> _matrix;
  BestSubmatrix bestSubmatrix = BestSubmatrix(
    result: 1,
    element: 0,
    coordinates: CoordinatesMatrix(
      start: Coordinate(i: 0, j: 0),
      end: Coordinate(i: 0, j: 0),
    ),
  );
  late File _outputFile;

  @override
  getResult(List<String> inputContent, String outputFile) {
    _outputFile = File(outputFile);
    _readInput(inputContent);
    _searchBestSubmatrix();
  }

  _readInput(List<String> inputContent) {
    List<String> nRowsColumns = inputContent.first.split(' ');
    _nRows = int.parse(nRowsColumns[0]);
    _nColumns = int.parse(nRowsColumns[1]);
    _matrix = [];
    for (var i = 0; i < _nRows; i++) {
      String row = inputContent[i + 1];
      _matrix.add([]);
      for (var j = 0; j < _nColumns; j++) {
        _matrix[i].add(int.parse(row[j]));
      }
    }
  }

  _searchBestSubmatrix() {
    int startI = 0;
    do {
      int startJ = 0;
      do {
        _searchRectangle(startI, startJ);

        startJ++;
      } while (startJ < _nColumns);
      startI++;
    } while (startI < _nRows);
  }

  _searchRectangle(int i, int j) {
    List<int> oppositeElements = [1, 0];
    int endJ = j;
    int currentElement = _matrix[i][j];
    do {
      int needRowsForNewRecord = (bestSubmatrix.result / (endJ - j + 1)).ceil();
      if (needRowsForNewRecord > (_nRows - i - 1) ||
          (_matrix[i + needRowsForNewRecord][j] != currentElement ||
              _matrix[i + needRowsForNewRecord][endJ] != currentElement) ||
          _matrix[i + needRowsForNewRecord - 1].sublist(j, endJ + 1).contains(oppositeElements[currentElement])) {
        endJ++;
        if (endJ == _nColumns) {
          break;
        }
        continue;
      }
      int endI = i;
      List<int> row = _matrix[endI].sublist(j, endJ + 1);
      do {
        int score = (endI - i + 1) * (endJ - j + 1);
        if (score > bestSubmatrix.result) {
          bestSubmatrix = BestSubmatrix(
            result: score,
            element: currentElement,
            coordinates: CoordinatesMatrix(
              start: Coordinate(i: i, j: j),
              end: Coordinate(i: endI, j: endJ),
            ),
          );
        }
        endI++;
        if (endI == _nRows) {
          break;
        }
        row = _matrix[endI].sublist(j, endJ + 1);
      } while (!row.contains(oppositeElements[currentElement]));

      endJ++;
      if (endJ == _nColumns) {
        break;
      }
    } while (_matrix[i][endJ] == _matrix[i][j]);
  }
}

class BestSubmatrix {
  int result;
  int element;
  CoordinatesMatrix coordinates;

  BestSubmatrix({required this.result, required this.element, required this.coordinates});
}

class CoordinatesMatrix {
  Coordinate start;
  Coordinate end;

  CoordinatesMatrix({required this.start, required this.end});
}

class Coordinate {
  int i;
  int j;

  Coordinate({required this.i, required this.j});
}
