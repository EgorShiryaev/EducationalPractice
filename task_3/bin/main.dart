import 'package:task_3/file_reader_writer.dart';

void main() {
  var task0 = FileReaderWriter(pathInput: 'task0.txt', pathOutput: 'ИСП-305-Ширяев Е В/ans1.txt');
  // task0.readProcessingWriteOutputfile();
  var task1 = FileReaderWriter(pathInput: 'task1.txt', pathOutput: 'ИСП-305-Ширяев Е В/ans1.txt');
  task1.readProcessingWriteOutputfile();
  var task2 = FileReaderWriter(pathInput: 'task2.txt', pathOutput: 'ИСП-305-Ширяев Е В/ans2.txt');
  task2.readProcessingWriteOutputfile();
  var task3 = FileReaderWriter(pathInput: 'task3.txt', pathOutput: 'ИСП-305-Ширяев Е В/ans3.txt');
  task3.readProcessingWriteOutputfile();
}
