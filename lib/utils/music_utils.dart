
import 'dart:async';

import 'package:ForQA/res/assets.dart';
import 'package:audioplayers/audioplayers.dart';

class Music {
  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();
  StreamSubscription? worker;

  Music._privateConstructor() {
    player.setVolume(0.5);
  }

  static final Music instance = Music._privateConstructor();

  void playSound() async {
    await player.play(AssetSource(Assets.soundCute));
    player.onPlayerComplete.listen((event) async {
      await player.play(AssetSource(Assets.soundCute));
    });
  }

  void stopLoop() {
    player.stop();
  }
}
