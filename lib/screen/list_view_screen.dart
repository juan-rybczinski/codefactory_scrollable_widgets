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
      body: renderBuilder(),
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
  }) {
    debugPrint(index.toString());
    return Container(
      height: 300,
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
