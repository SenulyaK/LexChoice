
class TimerManager {
  static final TimerManager _instance = TimerManager._internal();
  factory TimerManager() => _instance;
  TimerManager._internal();

  Stopwatch _stopwatch = Stopwatch();

  void startTimer() {
    _stopwatch.reset();
    _stopwatch.start();
  }

  void stopTimer() {
    _stopwatch.stop();
  }

  void resetTimer() {
    _stopwatch.reset();
  }

  String getElapsedTime() {
    final elapsed = _stopwatch.elapsed;
    return "${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}

final timerManager = TimerManager();
