import 'dart:developer';
import 'dart:math';

class BigNumber {
  String numberInString;
  late List<int> _numberInInt;
  BigNumber({required this.numberInString});

  List<int> convertingSearchAndCount() {
    _numberInInt = _convertingNumberInIntArray();
    int smallPartIndex = _searchSmallPart();
    return _countDivider(smallPartIndex);
   
  }

  List<int> _convertingNumberInIntArray() {
    /// максимальное число в int  9 223 372 036 854 775 808 это 19 знаков,
    /// но нам требуется где можно использовать все числа [0-9],
    /// поэтому берем 18
    int numberOfCharacterInInt = 18;
    int saveForLastElement = 1;
    int nDivider = numberInString.length ~/ numberOfCharacterInInt - saveForLastElement;
    List<int> number = [];
    for (int index = 0; index < nDivider; index++) {
      String numberCharacters =
          numberInString.substring(numberOfCharacterInInt * index, numberOfCharacterInInt * (index + 1));
      int numberInt = int.parse(numberCharacters);
      number.add(numberInt);
    }

    int startLastElement = numberOfCharacterInInt * (nDivider + saveForLastElement);
    if (numberInString.length > 18 && numberInString.length % 18 != 0) {
      startLastElement = numberOfCharacterInInt * nDivider + (((numberInString.length % 18 + 18) / 2).round());
      int preLastElement = int.parse(numberInString.substring(numberOfCharacterInInt * nDivider, startLastElement));
      number.add(preLastElement);
    }
    int lastElement = int.parse(numberInString.substring(startLastElement));
    number.add(lastElement);

    return number;
  }

  int _searchSmallPart() {
    int smallPartIndex = 0;
    for (int index = 0; index < _numberInInt.length; index++) {
      if (_numberInInt[index] < _numberInInt[smallPartIndex]) {
        smallPartIndex = index;
      }
    }
    return smallPartIndex;
  }

  List<int> _countDivider(int smallPartIndex) {
    int smallPart = _numberInInt[smallPartIndex];
    int forCount = sqrt(smallPart).floor();
    List<int> dividers = [];
    for (int divider = 1; divider <= forCount; divider++) {
      if (smallPart % divider != 0) {
        continue;
      }
      if (_checkOtherParts(divider)) {
        dividers.add(divider);
      }
    }

    List<int> newDividers = [];
    for (var divider in dividers.reversed) {
      newDividers.add((smallPart / divider).floor());
    }
    dividers.addAll(newDividers);

    return dividers;
  }

  bool _checkOtherParts(int divider) {
    for (int part in _numberInInt) {
      if (part % divider != 0) {
        return false;
      }
    }
    return true;
  }
}
