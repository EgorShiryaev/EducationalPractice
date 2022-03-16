import 'dart:io';

class Counter {
  final List<String> inputContent;
  final File outputFile;

  late int _arrayPower;
  late int _arrayLenght;
  late List<List<int>> _arrayDisunct;
  late List<List<int>> _nFalseTrue;
  late List<int> _falseElements;

  late List<bool> _result;
  late List<List<int>> _resultDisunctChecker;

  Counter({required this.inputContent, required this.outputFile});

  count() {
    _readInputData();
    _searchResult();
    _writeInOutputFile('Result', -1);
  }

  _readInputData() {
    List<String> powerAndLenght = inputContent.first.split(' ');
    _arrayPower = int.parse(powerAndLenght[0]);
    _arrayLenght = int.parse(powerAndLenght[1]);

    List<String> linesDisunct = inputContent.sublist(1);
    _arrayDisunct = [];
    _resultDisunctChecker = [];
    for (var i = 0; i < linesDisunct.length; i++) {
      _arrayDisunct.add([]);
      List<String> disunctArray = linesDisunct[i].split(' ');
      for (var disunct in disunctArray) {
        if (disunct != '') {
          _arrayDisunct[i].add(int.parse(disunct));
        }
      }
      _resultDisunctChecker.add(_arrayDisunct[i]);
    }
  }

  _searchResult() {
    _falseElements = [];
    _result = [false];

    for (var i = 1; i <= _arrayPower; i++) {
      _falseElements.add(i);
      _result.add(false);
    }

    while (_falseElements.isNotEmpty) {
      _countFalseTrue();
      _falseElements.sort(
        (a, b) => (_nFalseTrue[a][0] + _nFalseTrue[a][1]).compareTo(
          (_nFalseTrue[b][0] + _nFalseTrue[b][1]),
        ),
      );
      int currentElement = _falseElements.first;
      List<int> currentNFalseTrue = _nFalseTrue[currentElement];
      if (currentNFalseTrue.first < currentNFalseTrue.last) {
        _result[currentElement] = true;
      } else {
        _result[currentElement] = false;
      }
      _falseElements.removeAt(0);
      _removeTrueDisunct();
      _writeInOutputFile('Search result', _arrayLenght - _arrayDisunct.length);
    }
  }

  _countFalseTrue() {
    _nFalseTrue = [];
    _nFalseTrue.add([0, 0]);
    for (var i = 1; i <= _arrayPower; i++) {
      _nFalseTrue.add([0, 0]);
      _nFalseTrue[i][0] = 0;
      _nFalseTrue[i][1] = 0;
    }

    _arrayDisunct.forEach((lineDisuncts) {
      lineDisuncts.forEach((disunct) {
        _nFalseTrue[disunct.abs()][disunct < 0 ? 0 : 1];
      });
    });
  }

  _removeTrueDisunct() {
    for (var i = 0; i < _arrayDisunct.length; i++) {
      List<int> disunctElements = _arrayDisunct[i];
      bool firstElement = disunctElements[0] > 0 ? _result[disunctElements[0]] : !_result[disunctElements[0].abs()];
      bool secondElement = disunctElements[1] > 0 ? _result[disunctElements[1]] : !_result[disunctElements[1].abs()];
      bool thirdElement = disunctElements[2] > 0 ? _result[disunctElements[2]] : !_result[disunctElements[2].abs()];
      if (firstElement || secondElement || thirdElement) {
        _arrayDisunct.removeAt(i);
      }
       _writeInOutputFile('Search result', _arrayLenght - _arrayDisunct.length);
    }
  }

  _writeInOutputFile(String processName, int progress) {
    String output = '$processName\n';
    if (progress != -1) {
      output += '$progress/$_arrayLenght';
    } else {
      int score = _countScore();
      output += 'Score: $score\n';
      _result.removeAt(0);
      output += _result.join(' ').replaceAll('true', '1').replaceAll('false', '0');

    }
    outputFile.writeAsStringSync(output);
  }

  _countScore() {
    int score = 0;
    for (var i = 0; i < _resultDisunctChecker.length; i++) {
      List<int> disunctElements = _resultDisunctChecker[i];
      bool firstElement = disunctElements[0] > 0 ? _result[disunctElements[0]] : !_result[disunctElements[0].abs()];
      bool secondElement = disunctElements[1] > 0 ? _result[disunctElements[1]] : !_result[disunctElements[1].abs()];
      bool thirdElement = disunctElements[2] > 0 ? _result[disunctElements[2]] : !_result[disunctElements[2].abs()];
      if (firstElement || secondElement || thirdElement) {
        score++;
      }
    }
    return score;
  }
}
