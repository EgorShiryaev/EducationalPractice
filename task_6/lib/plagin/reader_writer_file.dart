import 'dart:io';

import 'interface.dart';

class ReaderWiterFile {
  final String inputPath;
  final String outputPath;
  final Interface algoritm;
  late List<String> _inputContent;
  late List<int> _outputAlgoritm;
  late String _output;
  ReaderWiterFile({required this.inputPath, required this.outputPath, required this.algoritm});

  writeResultInOutputFile() {
    File inputFile = File(inputPath);
    _inputContent = inputFile.readAsLinesSync();

    _outputAlgoritm = algoritm.getResult(_inputContent, outputPath);

    for (var i = 0; i < _outputAlgoritm.length; i++) {
      _outputAlgoritm[i]++;
    }
    _output = _outputAlgoritm.join(' ');
  }
}
