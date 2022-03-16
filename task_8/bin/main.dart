import 'package:task_8/count.dart';
import 'package:task_8/encoder_image.dart';
import 'package:task_8/plagin/reader_writer_file.dart';

void main(List<String> arguments) {
  ReaderWiterFile(inputPath: '_input/task2.txt', outputPath: '_output/ans2.txt', algoritm: EncoderImage())
      .writeResultInOutputFile();
}
