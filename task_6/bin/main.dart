import 'package:task_6/algoritm_impl.dart';
import 'package:task_6/plagin/reader_writer_file.dart';

void main(List<String> arguments) {
  // ReaderWiterFile(
  //   algoritm: AlgoritmImpl(),
  //   inputPath: '_input/task0.txt',
  //   outputPath: '_output/ans0',
  // ).writeResultInOutputFile();
  // ReaderWiterFile(
  //   algoritm: AlgoritmImpl(),
  //   inputPath: '_input/task1.txt',
  //   outputPath: '_output/ans1',
  // ).writeResultInOutputFile();
  ReaderWiterFile(
    algoritm: AlgoritmImpl(),
    inputPath: '_input/task2.txt',
    outputPath: '_output/ans2.txt',
  ).writeResultInOutputFile();
  ReaderWiterFile(
    algoritm: AlgoritmImpl(),
    inputPath: '_input/task3',
    outputPath: '_output/ans3.txt',
  ).writeResultInOutputFile();
}
