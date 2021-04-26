import 'package:flutter/foundation.dart';

class ChallengerController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) {
    currentPageNotifier.value = value;
  }

  final waitNextPageNotifier = ValueNotifier<bool>(false);
  bool get waitNextPage => waitNextPageNotifier.value;
  set waitNextPage(bool value) {
    waitNextPageNotifier.value = value;
  }

  int qtdAwnsersRight = 0;
}
