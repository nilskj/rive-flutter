import 'package:rive/src/rive_core/animation/blend_state_1d_instance.dart';
import 'package:rive/src/rive_core/animation/state_instance.dart';
import 'package:rive/src/rive_core/animation/state_machine_number.dart';
import 'package:rive/src/generated/animation/blend_state_1d_base.dart';
export 'package:rive/src/generated/animation/blend_state_1d_base.dart';

class BlendState1D extends BlendState1DBase {
  StateMachineNumber? _input;
  StateMachineNumber? get input => _input;

  void _changeInput(StateMachineNumber? value) {
    if (value == _input) {
      return;
    }

    _input = value;
  }

  @override
  void inputIdChanged(int from, int to) {
    _changeInput(context.resolve<StateMachineNumber>(to));
  }

  @override
  void onAddedDirty() {
    super.onAddedDirty();
    _changeInput(context.resolve<StateMachineNumber>(inputId));
  }

  @override
  StateInstance makeInstance() => BlendState1DInstance(this);
}
