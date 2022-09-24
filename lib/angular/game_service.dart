import 'dart:async';

import '../core/managers/game_state_manager.dart';
import '../game.dart';

class GameService {
  Game? _game;
  bool error = false;
  Object? errorMessage;
  StackTrace? stackTrace;

  final GameStateManager gameStateManager;

  GameService(this.gameStateManager);

  bool get menuVisible => gameStateManager.state == GameState.menu || error;

  bool get gameCanStart => _game != null;

  Future<void> initGame() async {
    await runZonedGuarded(() async {
      _game = Game(gameStateManager);
      await _game!.start();
      _game!.pause();
    }, (errorMessage, stackTrace) {
      error = true;
      this.errorMessage = errorMessage;
      this.stackTrace = stackTrace;
    });
  }

  void startGame() {
    if (gameCanStart) {
      _game!.resume();
      gameStateManager.state = GameState.playing;
    }
  }
}
