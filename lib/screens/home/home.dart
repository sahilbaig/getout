import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getout/providers/bar_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bar = ref.watch(barNotifierProvider);
    final barNotifier = ref.read(barNotifierProvider.notifier);

    return Row(
      children: [
        bar.when(
          data: (bar) => Text(bar.name),
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text("Error: $err"),
        ),
        ElevatedButton(
            onPressed: () {
              barNotifier.fetchAndChange();
            },
            child: Text("click me"))
      ],
    );
  }
}
