import 'dart:io';
import 'package:task_6/plagin/interface.dart';

class AlgoritmImpl implements Interface {
  late List<String> _inputContent;

  late int _n;
  List<List<int>> _buildPrice = [];
  List<List<int>> _trafficValue = [];
  List<List<int>> _trafficCost = [];

  List<List<List<int>>> _dataList = [];

  List<int> _factories = [];

  List<List<int>> _allSolutions = [];

  @override
  int journal = 0;

  late List<int> _bestResultArray;
  late int _bestResult = 9223372036854775800;

  late File _output;

  @override
  getResult(List<String> inContent, String outputFile) {
    _output = File(outputFile);
    _inputContent = inContent;
    _readInputData();
    _addDefaultBestResult();
    _searchBestResultRecursion(_bestResultArray, []);
    return _bestResultArray;
  }

  _readInputData() {
    int nReaderStroke = 0;
    _n = int.parse(_inputContent[nReaderStroke]);
    int nInputList = -1;
    _inputContent.removeAt(_n + 1);
    _inputContent.removeAt(2 * _n + 1);
    _inizializateInputList();
    nReaderStroke++;
    while (nReaderStroke < _n * 3) {
      nInputList++;
      for (var i = 0; i < _n; i++) {
        List<String> inputData = _inputContent[nReaderStroke].split(' ');
        inputData.forEach((number) {
          if (number != '') {
            _dataList[nInputList][i].add(int.parse(number));
          }
        });
        nReaderStroke++;
      }
    }
  }

  _inizializateInputList() {
    for (var i = 0; i < _n; i++) {
      _buildPrice.add([]);
      _trafficValue.add([]);
      _trafficCost.add([]);
    }
    _dataList = [_buildPrice, _trafficValue, _trafficCost];
  }

  _addDefaultBestResult() {
    List<int> defaltBestResult = [];
    for (var i = 0; i < _n; i++) {
      defaltBestResult.add(i);
    }
    _bestResultArray = defaltBestResult;
    _bestResult = _countScore(_bestResultArray);
  }

  _countScore(List<int> factories) {
    int score = 0;

    for (var i = 0; i < factories.length; i++) {
      score += _buildPrice[i][factories[i]];
    }
    if (_checkScore(score)) {
      return -1;
    }
    for (var i = 0; i < factories.length; i++) {
      int factoryFrom = factories[i];
      int placeFrom = i;
      for (var j = 0; j < _trafficValue[factoryFrom].length; j++) {
        int factoryTo = j;
        int placeTo = factories.indexOf(factoryTo);
        int trafficPrice = _trafficValue[factoryFrom][factoryTo] * _trafficCost[placeFrom][placeTo];
        score += trafficPrice;
      }
      if (_checkScore(score)) {
        return -1;
      }
    }

    return score;
  }

  _checkScore(int score) {
    return score >= _bestResult;
  }

  _searchBestResultRecursion(List<int> allNumbers, List<int> factories) {
    if (allNumbers.isEmpty) {
       journal++;
      int result = _countScore(factories);
      if (result == -1) {
        return;
      }
      if (result < _bestResult) {
        _bestResult = result;
        _bestResultArray = factories;

        _output.writeAsStringSync('result: $_bestResult\n' + _bestResultArray.join(' ') + '\n$journal/2 432 902 008 176 640 000');
      }
      return;
    }
    List<int> array = [];
    array.addAll(allNumbers);
    array.forEach((element) {
      List<int> newArray = [];
      newArray.addAll(allNumbers);
      newArray.remove(element);
      List<int> newResultArray = [];
      newResultArray.addAll(factories);
      newResultArray.add(element);
      _searchBestResultRecursion(newArray, newResultArray);
    });
  }
}
