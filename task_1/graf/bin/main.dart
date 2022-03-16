import 'package:graf/disconnected_set.dart';


void main() {
  DisconnectedSet(
    pathInputFile:
        '/Users/shiryaevegor/Desktop/study/УП 2021 5 симестр/Задание 1/task1.txt',
    pathOutputFile:
        '/Users/shiryaevegor/Desktop/study/УП 2021 5 симестр/Задание 1/ИСП-305-Ширяев Е В/ans1.txt',
  ).searchBestDisconnectedSet();
  DisconnectedSet(
    pathInputFile:
        '/Users/shiryaevegor/Desktop/study/УП 2021 5 симестр/Задание 1/task2.txt',
    pathOutputFile:
        '/Users/shiryaevegor/Desktop/study/УП 2021 5 симестр/Задание 1/ИСП-305-Ширяев Е В/ans2.txt',
  ).searchBestDisconnectedSet();
  

  Stopwatch stopwatch = Stopwatch()..start();
   DisconnectedSet(
    pathInputFile:
        '/Users/shiryaevegor/Desktop/study/УП 2021 5 симестр/Задание 1/task3.txt',
    pathOutputFile:
        '/Users/shiryaevegor/Desktop/study/УП 2021 5 симестр/Задание 1/ИСП-305-Ширяев Е В/ans3.txt',
  ).searchBestDisconnectedSet();
  print('searchBestDisconnectedSet() executed in ${stopwatch.elapsed}');
  stopwatch.stop();
}
