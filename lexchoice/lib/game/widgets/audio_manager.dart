import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioManager extends WidgetsBindingObserver {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal() {
    WidgetsBinding.instance.addObserver(this);
  }

  final AudioPlayer _player = AudioPlayer();
  final AudioPlayer _homeMusicPlayer = AudioPlayer();
  bool _isMuted = false;

  Future<void> playBackgroundMusic() async {
    if (!_isMuted) {
      await _player.setReleaseMode(ReleaseMode.loop);
      await _player.play(AssetSource('audio/game.mp3'));
    }
  }

  void playHomeMusic() async {
    if (!_isMuted) {
      await _homeMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await _homeMusicPlayer.play(AssetSource('audio/background.mp3'));
    }
  }

  void stopHomeMusic() async {
    await _homeMusicPlayer.stop();
  }

  Future<void> stopBackgroundMusic() async {
    await _player.stop();
  }

  Future<void> pauseBackgroundMusic() async {
    await _player.pause();
  }

  Future<void> resumeBackgroundMusic() async {
    if (!_isMuted) {
      await _player.resume();
    }
  }

  void toggleMuteBackgroundMusic(bool enabled) {
    _isMuted = !enabled;
    if (_isMuted) {
      stopHomeMusic();
    } else {
      playHomeMusic();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Pause or stop audio when the app is minimized

      stopHomeMusic();
    } else if (state == AppLifecycleState.resumed) {
      // Resume audio when the app is resumed
      if (!_isMuted) {
        playHomeMusic();
      }
    }
  }

  // Don't forget to remove the observer when you're done.
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopBackgroundMusic();
    stopHomeMusic();
  }
}

final audioManager = AudioManager();
