import 'dart:io';

import 'interface.dart';

class ReaderWiterFile {
  final String inputPath;
  final String outputPath;
  final Interface algoritm;
  late List<String> _inputContent;

  ReaderWiterFile({required this.inputPath, required this.outputPath, required this.algoritm});

  writeResultInOutputFile() {
    File inputFile = File(inputPath);
    _inputContent = inputFile.readAsLinesSync();

    algoritm.getResult(_inputContent, outputPath);
  }
}
