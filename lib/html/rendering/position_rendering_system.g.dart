// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_rendering_system.dart';

// **************************************************************************
// SystemGenerator
// **************************************************************************

abstract class _$PositionRenderingSystem extends EntitySystem {
  late final Mapper<Position> positionMapper;
  late final CameraManager cameraManager;
  _$PositionRenderingSystem() : super(Aspect.empty()..allOf([Position]));
  @override
  void initialize() {
    super.initialize();
    positionMapper = Mapper<Position>(world);
    cameraManager = world.getManager<CameraManager>();
  }

  @override
  void processEntities(Iterable<int> entities) {
    final positionMapper = this.positionMapper;
    for (final entity in entities) {
      processEntity(entity, positionMapper[entity]);
    }
  }

  void processEntity(int entity, Position position);
}
