import 'dart:developer';

class Graf {
  final List<List<int>> adjacencyTable;
  final List<int> vertexValues;

  Graf({
    required this.adjacencyTable,
    required this.vertexValues,
  });

  List<int> searchBestDisconnectedSet(List<int> startVertexArray) {
    int bestResult = 0;
    List<int> bestResultArray = [];
    for (var vertex in startVertexArray) {
      List<int> resultVertexArray =
          removeConnectedVertex(startVertexArray, vertex);
      int result = countResult(resultVertexArray, 0) + vertexValues[vertex - 1];
      if (result > bestResult) {
        resultVertexArray = searchBestDisconnectedSet(resultVertexArray);
      } else {
        resultVertexArray = [];
      }
      result = countResult(resultVertexArray, vertex);
      if (result > bestResult) {
        bestResult = result;
        bestResultArray = resultVertexArray;
        if (result > 300) {
          log('$result');
        }
      }
    }
    return bestResultArray;
  }

  List<int> removeConnectedVertex(List<int> startVertexArray, int vertex) {
    List<int> resultVertexArray = [];
    resultVertexArray.addAll(startVertexArray);
    resultVertexArray.remove(vertex);
    for (var connectVertex in startVertexArray) {
      if (adjacencyTable[vertex - 1].contains(connectVertex)) {
        resultVertexArray.remove(connectVertex);
      }
    }
    return resultVertexArray;
  }

  int countResult(List<int> vertexArray, int vertex) {
    if (vertex != 0) {
      vertexArray.insert(0, vertex);
    }
    int result = 0;
    vertexArray.forEach((indexVertex) {
      result += vertexValues[indexVertex - 1];
    });
    return result;
  }
}
