import 'package:ForQA/model/info_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    Key? key,
    required this.info,
  }) : super(key: key);

  final InfoModel info;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.info.caption,
        child: Column(
          children: [
            Expanded(child: Image.asset(widget.info.img)),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(widget.info.title),
              ],
            )
          ],
        ),
      ),
    );
  }
}
