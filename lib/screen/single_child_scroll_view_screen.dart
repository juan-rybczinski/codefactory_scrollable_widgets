import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderPerformance(),
    );
  }

  SingleChildScrollView renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final number in numbers)
            renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number,
            ),
        ],
      ),
    );
  }

  SingleChildScrollView renderPhysics() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics - 스크롤 안됨
      // AlwaysScrollableScrollPhysics - 스크롤 됨
      // BouncingScrollPhysics - iOS 스타일 스크롤
      // ClampingScrollPhysics - Android 스타일 스크롤
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          for (final color in rainbowColors) renderContainer(color: color),
        ],
      ),
    );
  }

  SingleChildScrollView renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  SingleChildScrollView renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  SingleChildScrollView renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final color in rainbowColors) renderContainer(color: color),
        ],
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      debugPrint(index.toString());
    }
    return Container(
      height: 300,
      color: color,
    );
  }
}
