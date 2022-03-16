import 'dart:io';
import 'graf.dart';

class DisconnectedSet {
  final String pathInputFile;
  final String pathOutputFile;

  DisconnectedSet({
    required this.pathInputFile,
    required this.pathOutputFile,
  });

  void searchBestDisconnectedSet() {
    File inputFile = File(pathInputFile);
    File outputFile = File(pathOutputFile);

    List<String> inputFileContent = inputFile.readAsLinesSync();
    int nVertex = int.parse(inputFileContent[0]);
    int nRibs = int.parse(inputFileContent[2]);

    String vertexValuesString = inputFileContent[1];
    List<int> vertexValues = [];
    List<int> startVertexArray = [];
    List<List<int>> adjacencyTable = [];

    for (int i = 0; i < nVertex; i++) {
      vertexValues.add(int.parse(vertexValuesString.split(' ')[i]));
      startVertexArray.add(i + 1);
      adjacencyTable.add([]);
    }

    List<String> rids = inputFileContent.sublist(3);

    for (var rid in rids) {
      List<String> startEndRid = rid.split(' ');
      int start = int.parse(startEndRid[0]);
      int end = int.parse(startEndRid[1]);
      adjacencyTable[start - 1].add(end);
      adjacencyTable[end - 1].add(start);
    }

    Graf graf = Graf(
      adjacencyTable: adjacencyTable,
      vertexValues: vertexValues,

    );

    List<int> resultVertexArray =
        graf.searchBestDisconnectedSet(startVertexArray);
    int result = 0;
    resultVertexArray.forEach((indexVertex) {
      result += vertexValues[indexVertex - 1];
    });

    outputFile.writeAsStringSync(
        'result: $result\n\nvertex: ${resultVertexArray.length}\nvertexArray: ${resultVertexArray.toString()}');
  }
}
