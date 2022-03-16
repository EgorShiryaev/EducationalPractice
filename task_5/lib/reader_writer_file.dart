import 'dart:io';
import 'package:task_5/interface.dart';
import 'file_entity.dart';

class ReaderWiterFile {
  final InputOutputFilesEntity IOFiles;
  final Interface algoritm;
  late List<String> _inputContent;
  late String _output;

  ReaderWiterFile({
    required this.IOFiles,
    required this.algoritm,
  });

  workingWithFiles() {
    _read();
    _process();
    _write();
  }

  _read() {
    File inputFile = File(IOFiles.inputPath);
    _inputContent = inputFile.readAsLinesSync();
  }

  _process() {
    algoritm.setInput(_inputContent);
    algoritm.process();
    _output = algoritm.getResult();
  }

  _write() {
    _makeCorrectOutput();
    File outputFile = File(IOFiles.outputPath);
    outputFile.writeAsStringSync(_output);
  }

  _makeCorrectOutput() {
    _output = '${_inputContent[0]}\n' + _inputContent[1].replaceAll(',', '\n');
  }
}
