import 'dart:developer';
import 'dart:io';

import 'package:task_12/rectangular_compression.dart';

void main(List<String> arguments) {
  for (var i = 0; i <= 3; i++) {
    final content = File('_input/task$i.txt').readAsLinesSync();
    String result = RectangularCompression(content).findResult();
    var f = 0;
    File('_output/ans$i.txt').writeAsStringSync(result);
  }
}
