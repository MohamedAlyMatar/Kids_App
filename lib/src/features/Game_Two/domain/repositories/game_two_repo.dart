abstract class GameTwoRepo {
  Future<void> initGame();
  int getCurrentTrial();
  int getScore();
  void updateScore(bool isCorrect);
  void retryTrials();

  Future<void> saveUserResponses();
}
