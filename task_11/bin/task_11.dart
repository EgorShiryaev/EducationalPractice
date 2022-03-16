import 'dart:io';

void main(List<String> arguments) {
  int number = 1;
  for (var i = 1; i <= 3; i++) {
    number *= 10;
    String outputData = '';
    for (var j = 0; j < number; j++) {
      outputData += '1 3 4 6\n';
    }
    File('_output/ans$i.txt').writeAsStringSync(outputData);
  }
}
