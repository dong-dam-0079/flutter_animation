import 'dart:math';

import 'package:ForQA/model/info_model.dart';
import 'package:ForQA/res/colors.dart';
import 'package:ForQA/view/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransformPageViewWidget extends StatefulWidget {
  const TransformPageViewWidget({super.key});

  @override
  State<TransformPageViewWidget> createState() =>
      _TransformPageViewWidgetState();
}

class _TransformPageViewWidgetState extends State<TransformPageViewWidget> {
  List<InfoModel> pageItems = generateSomeData();

  PageController? pageController;
  var viewportFraction = 0.8;
  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(
            () {
              setState(
                () {
                  pageOffset = pageController!.page;
                },
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return PageView.builder(
      controller: pageController,
      itemCount: pageItems.length,
      itemBuilder: (context, index) {
        var item = pageItems[index];

        double scale = max(viewportFraction,
            1 - (pageOffset! - index).abs() + viewportFraction);

        double angleY = (pageOffset! - index).abs();
        if (angleY > 0.5) {
          angleY = 1 - angleY;
        }
        return Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.04,
            left: size.width * 0.04,
            top: 50 - scale * 25,
            bottom: size.width * 0.06,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angleY),
            alignment: Alignment.center,
            child: Hero(
              tag: item.caption,
              child: Material(
                color: Colors.transparent,
                elevation: 15,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: InkWell(
                    onTap: () {
                      Get.to(DetailView(info: item));
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            item.img,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: AnimatedOpacity(
                            opacity: angleY == 0 ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 30, left: 20, right: 20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorsRes.backgroundTheme.withOpacity(0.05),
                                    ColorsRes.backgroundTheme2.withOpacity(0.5),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    item.caption,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
