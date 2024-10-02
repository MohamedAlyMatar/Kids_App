import 'package:kids_app/src/features/Game_Two/domain/repositories/game_two_repo.dart';

class RetryTrials {
  void call(GameTwoRepo service) {
    service.retryTrials();
  }
}
