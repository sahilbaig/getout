import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getout/models/bar_model.dart';
import "../repository/bar_repository.dart";

class BarClass extends AsyncNotifier<Bar> {
  @override
  Future<Bar> build() async {
    return BarService().fetchBars();
  }

  Future<void> fetchAndChange() async {
    state = const AsyncLoading();
    final newBar = await BarService().barReset();
    state = AsyncData(newBar);
  }
}

final barNotifierProvider = AsyncNotifierProvider<BarClass, Bar>(() {
  return BarClass();
});
