import 'package:kids_app/src/features/Game_Two/domain/repositories/game_two_repo.dart';

class UpdateScore {
  Future<void> call(GameTwoRepo service, bool correct) async {
    service.updateScore(correct);
  }
}
