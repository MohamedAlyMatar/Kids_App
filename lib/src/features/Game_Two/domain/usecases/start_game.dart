import 'package:kids_app/src/features/Game_Two/domain/repositories/game_two_repo.dart';

class StartGame {
  // Business logic for starting a game
  Future<void> call(GameTwoRepo service) async {
    await service.initGame(); // Await the asynchronous initGame method
  }
}
