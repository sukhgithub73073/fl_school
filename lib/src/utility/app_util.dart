import 'dart:math';

import 'package:flutter/foundation.dart';

void printLog(dynamic msg) {
  _printLog('\x1B[32m() => ${msg.toString()}\x1B[0m');
}

void _printLog(dynamic msg) {
  if (kDebugMode) {
    debugPrint(msg.toString());
  }
}

void blocLog({required String msg, required String bloc}) {
  _printLog("\x1B[31m${bloc.toString()} ::==> ${msg.toString()}\x1B[0m");
}

String getRandomId({required String text}) {
  String cleanString = text.replaceAll(RegExp(r'[^\w\s]'), '');
  String acronym = cleanString
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => word[0])
      .join('');
  String randomNumber = "${Random().nextInt(90000) + 10000}";
  return acronym + randomNumber.toString();
}
