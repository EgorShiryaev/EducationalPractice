import 'dart:developer';

class Graf {
  List<String> inputContent;
  late int _nVertex;
  late int _nRibs;
  late List<List<int>> _tableAdjacenies;
  late List<int> vertexColors;
  late int nColor;
  late List<int> _bestPlan;

  Graf({required this.inputContent});

  readAndDrawVertex() {
    _readVertexRibs();
    _createTable();
    _searchBestPlan();
    _paintVertex();
    _countColor();
  }

  _readVertexRibs() {
    String vertexAndRibs = inputContent[0];
    _nVertex = int.parse(vertexAndRibs.split(' ')[0]);
    _nRibs = int.parse(vertexAndRibs.split(' ')[1]);
  }

  _createTable() {
    _tableAdjacenies = [];
    for (var i = 0; i < _nVertex; i++) {
      _tableAdjacenies.add([]);
    }
    _fillTable();
  }

  _fillTable() {
    for (var i = 1; i <= _nRibs; i++) {
      List<String> startEndRid = inputContent[i].split(' ');
      int start = int.parse(startEndRid[0]) - 1;
      int end = int.parse(startEndRid[1]) - 1;
      _tableAdjacenies[start].add(end);
      _tableAdjacenies[end].add(start);
    }
  }

  _searchBestPlan() {
    List<int> vertexes = [];
    for (var i = 0; i < _nVertex; i++) {
      vertexes.add(i);
    }
    _bestPlan = [];
    for (var i = 0; i < _nVertex; i++) {
      int maxIndex = vertexes[0];
      for (var j = 0; j < vertexes.length; j++) {
        if (_tableAdjacenies[vertexes[j]].length > _tableAdjacenies[maxIndex].length) {
          maxIndex = vertexes[j];
        }
      }
      _bestPlan.add(maxIndex);
      vertexes.remove(maxIndex);
    }
    _bestPlan = _bestPlan;
  }

  _paintVertex() {
    _paintDefaultColor();
    for (var i = 0; i < _nVertex; i++) {
      List<int> connectVertex = _tableAdjacenies[_bestPlan[i]];
      for (var j = 0; j < connectVertex.length; j++) {
        if (vertexColors[connectVertex[j]] == vertexColors[_bestPlan[i]]) {
          vertexColors[connectVertex[j]] = vertexColors[_bestPlan[i]] + 1;
        }
      }
    }
  }

  _paintDefaultColor() {
    nColor = 1;
    vertexColors = [];
    for (var i = 0; i < _nVertex; i++) {
      vertexColors.add(1);
    }
  }

  _countColor() {
    var colors = [];
   colors.insertAll(0, vertexColors);
    colors.sort();
    nColor = colors.last;
  }
}
