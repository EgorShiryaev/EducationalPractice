import 'dart:io';

class DisjunctionSet {
  final List<String> inputData;
  final File outputFile;

  late int _power;
  late int _nDisjunction;
  late List<List<int>> _disjunctions;

  DisjunctionSet({required this.inputData, required this.outputFile});

  call() {
    _readInputData();
  }

  _readInputData() {
    _nDisjunction =int.parse(inputData[0].split(' ')[1]);
    List<int> output = [];
    for (var i = 0; i < _nDisjunction; i++) {
      output.add(1);
    }
    outputFile.writeAsStringSync(output.join(' '));
  }
}
