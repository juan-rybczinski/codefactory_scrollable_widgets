import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/const/numbers.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: renderSeparated(),
    );
  }

  ListView renderSeparated() {
    return ListView.separated(
      itemCount: numbers.length,
      itemBuilder: (context, number) => renderContainer(
        color: rainbowColors[number % rainbowColors.length],
        index: number,
      ),
      separatorBuilder: (context, number) {
        number += 1;

        if (number % 5 == 0) {
          return renderContainer(
              color: Colors.black, index: number, height: 200);
        } else {
          return const SizedBox(height: 100);
        }
      },
    );
  }

  ListView renderBuilder() {
    return ListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, number) => renderContainer(
        color: rainbowColors[number % rainbowColors.length],
        index: number,
      ),
    );
  }

  ListView renderDefault() {
    return ListView(
      children: [
        for (final number in numbers)
          renderContainer(
            color: rainbowColors[number % rainbowColors.length],
            index: number,
          ),
      ],
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    debugPrint(index.toString());
    return Container(
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
