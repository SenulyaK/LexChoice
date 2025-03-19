class ScoreManager {
  int _score = 100; // Initial score

  void deductPoints() {
    _score -= 20;
    if (_score < 0) _score = 0; // Prevent negative scores
  }

  int getScore() => _score;

  int calculateStars() {
    if (_score == 100) return 3;
    if (_score >= 60) return 2;
    if (_score >= 20) return 1;
    return 0;
  }

  void resetScore() {
    _score = 100; // Reset for new game
  }
}

final ScoreManager scoreManager = ScoreManager(); // Global instance
