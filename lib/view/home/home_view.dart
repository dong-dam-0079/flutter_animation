import 'package:flutter/material.dart';
import 'package:flutter_animation/res/colors.dart';
import 'package:flutter_animation/res/dimens.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../res/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ItemScrollController scrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();


@override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundTheme,
      body: Hero(
        tag: 'open_box',
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imageBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: ScrollablePositionedList.builder(
            itemScrollController: scrollController,
            itemPositionsListener: itemPositionsListener,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight,
                padding: const EdgeInsets.only(
                  left: DimensRes.sp16,
                  right: DimensRes.sp16,
                  top: kToolbarHeight,
                ),
                child: const Center(
                  child: Text(
                    'Data',
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
