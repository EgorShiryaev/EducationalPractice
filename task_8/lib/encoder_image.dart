import 'dart:io';
import 'package:image/image.dart';
import 'package:task_8/plagin/interface.dart';

class EncoderImage implements Interface {
  @override
  getResult(List<String> inputContent, String outputFile) {
    final nRowsAndColumns = int.parse(inputContent[0].split(' ')[0]);
    Image image = Image(nRowsAndColumns, nRowsAndColumns);
    for (var i = 0; i < nRowsAndColumns; i++) {
      String row = inputContent[i + 1];
      for (var j = 0; j < nRowsAndColumns; j++) {
        if (row[j] == '0') {
          image.setPixelRgba(j, i, 255, 255, 255);
        } else {
          image.setPixelRgba(j, i, 0, 0, 0);
        }
      }
    }
    File(outputFile).writeAsBytes(encodeJpg(image));
  }
}
