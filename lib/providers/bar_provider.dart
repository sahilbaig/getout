import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarClass extends Notifier<String> {
  @override
  String build() {
    return "Intials Data";
  }

  void changeName() {
    state = "changed name";
  }
}

final barNotifierProvider = NotifierProvider<BarClass, String>(() {
  return BarClass();
});
