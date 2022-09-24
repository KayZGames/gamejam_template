// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic.dart';

// **************************************************************************
// SystemGenerator
// **************************************************************************

abstract class _$ControllerToActionSystem extends EntitySystem {
  late final Mapper<Controller> controllerMapper;
  late final Mapper<Acceleration> accelerationMapper;
  _$ControllerToActionSystem()
      : super(Aspect.empty()..allOf([Controller, Acceleration]));
  @override
  void initialize() {
    super.initialize();
    controllerMapper = Mapper<Controller>(world);
    accelerationMapper = Mapper<Acceleration>(world);
  }

  @override
  void processEntities(Iterable<int> entities) {
    final controllerMapper = this.controllerMapper;
    final accelerationMapper = this.accelerationMapper;
    for (final entity in entities) {
      processEntity(
          entity, controllerMapper[entity], accelerationMapper[entity]);
    }
  }

  void processEntity(
      int entity, Controller controller, Acceleration acceleration);
}
