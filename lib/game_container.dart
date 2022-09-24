import 'package:ngdart/angular.dart';

import 'angular/game_menu.dart';
import 'angular/game_service.dart';
import 'core/managers/game_state_manager.dart';

@Component(
  selector: 'game-container',
  templateUrl: 'game_container.html',
  styleUrls: ['game_container.css'],
  providers: [
    ClassProvider(GameService),
    ClassProvider(GameStateManager),
  ],
  directives: [
    GameMenu,
    coreDirectives,
  ],
)
class GameContainer implements OnInit {
  GameService gameService;
  GameContainer(this.gameService);
  bool get menuVisible => gameService.menuVisible;

  @override
  Future<void> ngOnInit() async => gameService.initGame();
}
