import 'dart:io';
import 'package:task_4/file_entity.dart';
import 'package:task_4/graf.dart';

class ReaderWiterFile {
  final InputOutputFilesEntity files;
  late List<String> _inputContent;
  late Graf _result;
  late String _output;
  ReaderWiterFile({
    required this.files,
  });

  workingWithFiles() {
    _read();
    _process();
    _write();
  }

  _read() {
    File inputFile = File(files.inputPath);
    _inputContent = inputFile.readAsLinesSync();
  }

  _process() {
    
    Graf graf = Graf(inputContent: _inputContent);
    graf.readAndDrawVertex();
    _result = graf;
  }

  _write() {
    _makeCorrectOutput();
    File outputFile = File(files.outputPath);
    outputFile.writeAsStringSync(_output);
  }

  _makeCorrectOutput() {
    String outputArray = _result.vertexColors.toString();
    outputArray = outputArray.replaceAll(',', '');
    outputArray = outputArray.replaceFirst('[', '');
    outputArray = outputArray.replaceFirst(']', '');
    _output = '${_result.nColor}\n' + outputArray;
  }
}
