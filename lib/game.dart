import 'package:dartemis/dartemis.dart';
import 'package:gamedev_helpers/gamedev_helpers.dart';

import 'components/components.dart';
import 'core/logic.dart';
import 'core/managers/game_state_manager.dart';
import 'html/input/controller_system.dart';
import 'html/rendering/position_rendering_system.dart';

class Game extends GameBase {
  final GameStateManager gameStateManager;
  Game(this.gameStateManager) : super.noAssets('%game_dir%');

  @override
  void createEntities() {
    addEntity([
      Controller(),
      Position(0.5, 0),
      Acceleration(0, 0),
      Velocity(0, 0),
      Mass(1),
    ]);
  }

  @override
  Map<int, List<EntitySystem>> getSystems() => {
        GameBase.rendering: [
          ControllerSystem(),
          ResetAccelerationSystem(),
          ControllerToActionSystem(),
          SimpleGravitySystem(),
          SimpleAccelerationSystem(),
          SimpleMovementSystem(),
          CanvasCleaningSystem(canvas),
          PositionRenderingSystem(ctx),
          FpsRenderingSystem(ctx, 'white'),
        ],
      };

  @override
  List<Manager> getManagers() => [gameStateManager];
}
