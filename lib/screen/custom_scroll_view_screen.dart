import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/const/numbers.dart';
import 'package:scrollable_widgets/generated/assets.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderBuilderSliverGrid(),
          renderBuilderSliverList(),
        ],
      ),
    );
  }

  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      // 스크롤 했을 때 리스트의 중간에도 AppBar가 내려오게 할 수 있음
      floating: true,
      // 완전 고정
      pinned: false,
      // 자석 효과, floating=true에만 사용 가능
      snap: false,
      // 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
      stretch: false,
      expandedHeight: 200,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          Assets.imageProfile,
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'),
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  SliverGrid renderBuilderSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => renderContainer(
          color: rainbowColors[numbers[index] % rainbowColors.length],
          index: numbers[index],
        ),
        childCount: numbers.length,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
  }

  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        [
          for (final number in numbers)
            renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number,
            ),
        ],
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => renderContainer(
          color: rainbowColors[numbers[index] % rainbowColors.length],
          index: numbers[index],
        ),
        childCount: numbers.length,
      ),
    );
  }

  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          for (final number in numbers)
            renderContainer(
              color: rainbowColors[number % rainbowColors.length],
              index: number,
            ),
        ],
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
