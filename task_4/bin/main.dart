import 'package:task_4/file_entity.dart';
import 'package:task_4/reader_writer_file.dart';

void main(List<String> arguments) {
  InputOutputFilesEntity files = InputOutputFilesEntity(
    inputPath: 'task0.txt',
    outputPath: 'ИСП-302 Ширяев Е В/ans0.txt',
  );
  ReaderWiterFile input0 = ReaderWiterFile(files: files);
  input0.workingWithFiles();

  files = InputOutputFilesEntity(
    inputPath: 'task1.txt',
    outputPath: 'ИСП-302 Ширяев Е В/ans1.txt',
  );
  ReaderWiterFile input1 = ReaderWiterFile(files: files);
  input1.workingWithFiles();

  files = InputOutputFilesEntity(
    inputPath: 'task2.txt',
    outputPath: 'ИСП-302 Ширяев Е В/ans2.txt',
  );
  ReaderWiterFile input2 = ReaderWiterFile(files: files);
  input2.workingWithFiles();

  files = InputOutputFilesEntity(
    inputPath: 'task3.txt',
    outputPath: 'ИСП-302 Ширяев Е В/ans3.txt',
  );
  ReaderWiterFile input3 = ReaderWiterFile(files: files);
  input3.workingWithFiles();
}
