import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/const/numbers.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ScrollbarScreen extends StatelessWidget {
  const ScrollbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return MainLayout(
      title: 'ScrollbarScreen',
      body: Scrollbar(
        controller: controller,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              for (final number in numbers)
                renderContainer(
                  color: rainbowColors[number % rainbowColors.length],
                  index: number,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    debugPrint(index.toString());
    return Container(
      key: Key(index.toString()),
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
