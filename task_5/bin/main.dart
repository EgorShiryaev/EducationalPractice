import 'package:task_5/file_entity.dart';
import 'package:task_5/game.dart';
import 'package:task_5/reader_writer_file.dart';

void main(List<String> arguments) {

  InputOutputFilesEntity files = InputOutputFilesEntity(
    inputPath: 'task1.txt',
    outputPath: 'ans/ans1.txt',
  );
  ReaderWiterFile input1 = ReaderWiterFile(IOFiles: files, algoritm: Game());
  input1.workingWithFiles();

   files = InputOutputFilesEntity(
    inputPath: 'task2.txt',
    outputPath: 'ans/ans2.txt',
  );
  ReaderWiterFile input2 = ReaderWiterFile(IOFiles: files, algoritm: Game());
  input2.workingWithFiles();

  files = InputOutputFilesEntity(
    inputPath: 'task3.txt',
    outputPath: 'ans/ans3.txt',
  );
  ReaderWiterFile input3 = ReaderWiterFile(IOFiles: files, algoritm: Game());
  input3.workingWithFiles();

  
}
