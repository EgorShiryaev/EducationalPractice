import 'dart:developer';
import 'dart:io';
import 'package:task_3/number.dart';

class FileReaderWriter {
  String pathInput;
  String pathOutput;

  FileReaderWriter({
    required this.pathInput,
    required this.pathOutput,
  });

  void readProcessingWriteOutputfile() {
    File input = File(pathInput);
    String inputContent = input.readAsStringSync();

    BigNumber number = BigNumber(numberInString: inputContent);
    List<int> dividers = number.convertingSearchAndCount();

    File output = File(pathOutput);
    String outputContent = '${dividers.length}';
    dividers.forEach((element) {
      outputContent += '\n$element';
    });
    output.writeAsStringSync(outputContent);
  }
}
