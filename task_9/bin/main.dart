import 'dart:io';
import 'package:task_9/disjunction_set.dart';

void main(List<String> arguments) {
  for (var i = 0; i <= 3; i++) {
    List<String> inputContent = File('_input/task$i.txt').readAsLinesSync();
    DisjunctionSet(inputData: inputContent, outputFile: File('_output/ans$i.txt')).call();
  }
}
