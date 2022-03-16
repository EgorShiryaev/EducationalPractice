import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:task_7/plagin/interface.dart';

class Creater implements Interface {
  late List<String> _input;
  late int _n;
  late List<BigInt> _numbers;
  late List<List<BigInt>> _dividersOfNumber;
  late Map<BigInt, List<BigInt>> _dividerMap;
  late List<String> _pairs;
  late File _outputFile;

  @override
  getResult(List<String> inputContent, String outputFile) {
    _input = inputContent;
    _outputFile = File(outputFile);
    _readInput();
    _searchDividers();
    _pairing();
  }

  _readInput() {
    _n = int.parse(_input[0]);
    _numbers = [];
    List<String> numbersString = _input[1].split(' ');
    numbersString.forEach((element) {
      _numbers.add(BigInt.parse(element));
    });
  }

  _searchDividers() {
    _dividersOfNumber = [];
    for (var i = 0; i < _n; i++) {
      _dividersOfNumber.add([]);
      BigInt currentNumber = _numbers[i];
      for (var divierIndex = 0; divierIndex < i; divierIndex++) {
        if (currentNumber % _numbers[divierIndex] == BigInt.zero) {
          _dividersOfNumber[i].add(_numbers[divierIndex]);
        }
        if (_numbers[divierIndex] * BigInt.two >= currentNumber) {
          break;
        }
      }
    }
    _createDividerMap();
    SplayTreeMap sortDividerMap = SplayTreeMap.from(_dividerMap);
    _dividerMap = Map.from(sortDividerMap);
  }

  _createDividerMap() {
    _dividerMap = {};
    for (var i = 0; i < _dividersOfNumber.length; i++) {
      BigInt number = _numbers[i];
      for (var j = 0; j < _dividersOfNumber[i].length; j++) {
        BigInt divider = _dividersOfNumber[i][j];
        if (_dividerMap[divider] == null) {
          _dividerMap[divider] = [number];
        } else {
          _dividerMap[divider]!.add(number);
        }
      }
    }
    _dividerMap.removeWhere((key, value) => value.length == 1);
  }

  _pairing() {
    _pairs = [];
    Iterable<BigInt> keys = _dividerMap.keys.toList().reversed;
    int nComplete = 0;
    keys.forEach((key) {
      List<BigInt> values = _dividerMap[key]!;
      values.sort((a, b) =>
          _dividersOfNumber[_numbers.indexOf(a)].length.compareTo(_dividersOfNumber[_numbers.indexOf(b)].length));
      while (values.length > 1) {
        double score = log(key.toDouble()) / log(10);
        BigInt number1 = values[0];
        BigInt number2 = values[values.length - 1];
        _pairs.add('$number1 $number2 divider: $key score: $score');
        _deleteInMap(number1);
        _deleteInMap(number2);
      }
      _deleteInMatrix(key);
      nComplete++;
    });
  }

  _deleteInMap(BigInt number) {
    _dividerMap.forEach((key, value) {
      if (value.contains(number)) {
        value.remove(number);
      }
    });
  }

  _deleteInMatrix(BigInt numberDivider) {
    _dividersOfNumber.forEach((element) {
      if (element.contains(numberDivider)) {
        element.remove(numberDivider);
      }
    });
  }
}
