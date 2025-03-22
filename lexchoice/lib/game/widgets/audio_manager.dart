import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final AudioPlayer _player = AudioPlayer();
  final AudioPlayer _homeMusicPlayer = AudioPlayer();

  Future<void> playBackgroundMusic() async {
    await _player.setReleaseMode(ReleaseMode.loop); // Loop music
    await _player.play(AssetSource('audio/game.mp3'));
  }

  // Play home screen music
  void playHomeMusic() async {
    await _homeMusicPlayer.setReleaseMode(ReleaseMode.loop);
    await _homeMusicPlayer.play(AssetSource('audio/background.mp3'));
  }

  // Stop home screen music
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
    await _player.resume();
  }
}

final audioManager = AudioManager();
