import 'package:task_7/creater.dart';
import 'package:task_7/plagin/reader_writer_file.dart';

void main(List<String> arguments) {
  ReaderWiterFile(inputPath: '_input/task3.txt', outputPath: '_output/ans3.txt', algoritm: Creater())
      .writeResultInOutputFile();
}
