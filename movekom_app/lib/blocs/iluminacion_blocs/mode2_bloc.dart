
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/slider_controller.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_bano_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_cocina_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_habitacion_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_parque_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_salon_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/upligth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Mode2Event extends Equatable {
  Mode2Event([List props = const []]) : super(props);
}

class Enable extends Mode2Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableMode2 extends Mode2Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends Mode2Event {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}
class SaveMode2 extends Mode2Event { /// Deshabilita la bateria
  BuildContext _context;
  SaveMode2(this._context);
  @override
  String toString() => 'DisableBatery';
}
class LoadMode2 extends Mode2Event { /// Deshabilita la bateria
  BuildContext _context;
  LoadMode2(this._context);
  @override
  String toString() => 'DisableBatery';
}

@immutable
abstract class Mode2State {
  final bool isEnabled;
  final double valueDimer;
  Mode2State({this.isEnabled, this.valueDimer});
}

class InitialMode2State extends Mode2State {
  InitialMode2State( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? false,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewMode2State extends Mode2State {
  NewMode2State.fromOldSettingState(Mode2State oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}
/// FIN  declaracion de STATE

class Mode2Bloc extends Bloc <Mode2Event, Mode2State> {

  @override
  // TODO: implement initialState
  Mode2State get initialState => InitialMode2State();

  @override
  Stream<Mode2State> mapEventToState(Mode2Event event) async* {
    if (event is Enable) {
      yield NewMode2State.fromOldSettingState(state,
          isEnabled: true);

    } else if (event is Update){
      yield NewMode2State.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is DisableMode2) {
      yield NewMode2State.fromOldSettingState(state,
          isEnabled: false);
    } else if (event is SaveMode2) {
      saveModeValues(event);
      yield NewMode2State.fromOldSettingState(state,
          isEnabled: true);

    } else if (event is LoadMode2) {
      disableMode1(event._context);
      yield* _mapToLoadMode1(event, state);
    }
  }




  void saveModeValues(event) async {
    print("SAVE MODE 1");
    final prefs = await SharedPreferences.getInstance();
    final lucesCocinaBloc = BlocProvider.of<LucesCocinaBloc>(event._context);
    final lucesBano = BlocProvider.of<LucesBanoBloc>(event._context);
    final lucesHabitacion = BlocProvider.of<LucesHabitacionBloc>(
        event._context);
    final lucesSalon = BlocProvider.of<LucesSalonBloc>(event._context);
    final lucesUplight = BlocProvider.of<UpligthBloc>(event._context);
    final lucesExterior = BlocProvider.of<LucesExteriorBloc>(event._context);


    prefs.setDouble('mode2_luz_cocina', lucesCocinaBloc.state.valueDimer);
    prefs.setDouble('mode2_luz_bano', lucesBano.state.valueDimer);
    prefs.setDouble('mode2_luz_habitacion', lucesHabitacion.state.valueDimer);
    prefs.setDouble('mode2_luz_salon', lucesSalon.state.valueDimer);
    prefs.setDouble('mode2_luz_uplight', lucesUplight.state.valueDimer);
    prefs.setDouble('mode2_luz_exterior', lucesExterior.state.valueDimer);
  }

  Future<bool> loadAllValuses(LoadMode2 event) async {
    final lucesCocinaBloc = BlocProvider.of<LucesCocinaBloc>(event._context);
    final lucesBano = BlocProvider.of<LucesBanoBloc>(event._context);
    final lucesHabitacion = BlocProvider.of<LucesHabitacionBloc>(event._context);
    final lucesSalon = BlocProvider.of<LucesSalonBloc>(event._context);
    final lucesUplight = BlocProvider.of<UpligthBloc>(event._context);
    final lucesExterior = BlocProvider.of<LucesExteriorBloc>(event._context);
    try {
      final prefs = await SharedPreferences.getInstance();
      lucesCocinaBloc.add(UpdateCocinaFromMode(
          prefs.getDouble('mode2_luz_cocina') ?? 0));
      lucesBano.add(UpdateBanoFromMode(prefs.getDouble('mode2_luz_bano') ?? 0));
      lucesHabitacion.add(
          UpdateLucesHabitacionFromMode(prefs.getDouble('mode2_luz_habitacion') ?? 0));
      lucesSalon.add(UpdateLucesSalonFromMode(prefs.getDouble('mode2_luz_salon') ?? 0));
      lucesUplight.add(
          UpdateUplightFromMode(prefs.getDouble('mode2_luz_uplight') ?? 0));
      lucesExterior.add(
          UpdateLucesExteriorFromMode(prefs.getDouble('mode2_luz_exterior') ?? 0));
      print("ENABLING");
      return true;
    } catch (_) {
      print("ERRORRR");
      return false;
    }
  }



  Stream<Mode2State> _mapToLoadMode1(LoadMode2 event, state) async* {
    try {
      final ready = await loadAllValuses(event);
      yield NewMode2State.fromOldSettingState(state,
          isEnabled: true);
    } catch (_) {
      print("ERRORRR");
    }
  }
}
