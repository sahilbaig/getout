import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getout/providers/bar_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barWatcher = ref.watch(barNotifierProvider);
    return Center(
        child: Column(
      children: [
        Text(barWatcher),
        ElevatedButton(
            onPressed: () {
              ref.read(barNotifierProvider.notifier).changeName();
            },
            child: Text("Change name"))
      ],
    ));
  }
}
