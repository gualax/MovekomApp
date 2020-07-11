
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/slider_controller.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_bano_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_habitacion_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_parque_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_salon_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/upligth_bloc.dart';

import 'luces_cocina_bloc.dart';

abstract class LuzGeneralEvent extends Equatable {

  LuzGeneralEvent([List props = const []]) : super(props);
}

class EnableGeneral extends LuzGeneralEvent {  /// Habilita la bateria
  BuildContext _context;
  EnableGeneral(this._context);
  @override
  String toString() => 'EnableBatery';
}

class DisableGeneral extends LuzGeneralEvent { /// Deshabilita la bateria
  BuildContext _context;
  DisableGeneral(this._context);
  @override
  String toString() => 'DisableBatery';
}

class Update extends LuzGeneralEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LuzGeneralState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LuzGeneralState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LuzGeneralState.initial() {
    return LuzGeneralState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LuzGeneralState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LuzGeneralState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueDimer: valueDimer ?? this.valueDimer,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueDimer }';
  }
}
/// FIN  declaracion de STATE

class LuzGeneralBloc extends Bloc <LuzGeneralEvent, LuzGeneralState> {

  @override
  // TODO: implement initialState
  LuzGeneralState get initialState => LuzGeneralState.initial();

  @override
  Stream<LuzGeneralState> mapEventToState(LuzGeneralEvent event) async* {
    if (event is EnableGeneral) {
      mapedLucesStates(event);
      yield LuzGeneralState.initial();
    } else if (event is Update){
      yield LuzGeneralState(
        isEnabled: true,
        valueDimer: event.valueDimer,
      );
    } else if (event is DisableGeneral) {
      disableModes(event._context);
      mapedLucesStates(event);
      yield LuzGeneralState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }

}
void mapedLucesStates(event){

  final lucesCocinaBloc = BlocProvider.of<LucesCocinaBloc>(event._context);
  final lucesBano = BlocProvider.of<LucesBanoBloc>(event._context);
  final lucesHabitacion = BlocProvider.of<LucesHabitacionBloc>(event._context);
  final lucesSalon = BlocProvider.of<LucesSalonBloc>(event._context);
  final LucesUplight = BlocProvider.of<UpligthBloc>(event._context);

  if (event is DisableGeneral){
    lucesCocinaBloc.add(DisableCocina());
    lucesBano.add(DisableLucesBano());
    lucesHabitacion.add(DisableLucesHabitacion());
    lucesSalon.add(DisableLucesSalon());
    LucesUplight.add(DisableUplight());
  } else {
    lucesCocinaBloc.add(EnableCocina());
    lucesBano.add(EnableLucesBano());
    lucesHabitacion.add(EnableLucesHabitacion());
    lucesSalon.add(EnableLucesSalon());
    LucesUplight.add(EnableUplight());
  }

}