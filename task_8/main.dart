import 'package:task_8/count.dart';
import 'package:task_8/plagin/reader_writer_file.dart';

void main(List<String> arguments) {
  ReaderWiterFile(inputPath: '_input/task0.txt', outputPath: '_output/ans0.txt', algoritm: Count())
      .writeResultInOutputFile();
}
