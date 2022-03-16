import 'dart:io';

import 'dart:math';

void main(List<String> arguments) {
  String input = '_input/task';
  String output = '_output/ans';
  for (var i = 1; i <= 3; i++) {
    searchResult(input + '$i.txt', output + '$i.txt');
  }
}

searchResult(String input, String output) {
  final inputContent = File(input).readAsLinesSync();
  final List<List<int>> numbers = [];
  final List<List<double>> result = [];

  int i = -1;
  for (var stroke in inputContent) {
    i++;
    List<String> numbersInString = stroke.split(' ');
    numbers.add([]);
    result.add([]);
    numbersInString.forEach((number) {
      if (number != ' ' && number != '') {
        numbers[i].add(int.parse(number));
      }
    });
  }

  i = -1;
  numbers.forEach((stroke) {
    i++;
    int j = -1;
    stroke.forEach((element) {
      j++;
      result[i].add(countComplexity(numbers[i][j]));
    });
  });
  String outputContent = '';
  result.forEach((element) {
    double output = 1;
    element.forEach((resultNumber) {
      output *= log(resultNumber);
    });
    outputContent += '$output\n';
  });

  File(output).writeAsString(outputContent);
}

countComplexity(int number) {
  return log(sqrt(number)) / log(2);
}
