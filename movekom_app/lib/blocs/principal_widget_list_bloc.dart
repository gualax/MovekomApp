import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WidgetListEvent extends Equatable {
  WidgetListEvent([List props = const []]) : super(props);
}


class Empty extends WidgetListEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class AddWidget extends WidgetListEvent { /// Deshabilita la bateria
  final Widget _widget;
  AddWidget(this._widget) : super([_widget]);

  @override
  String toString() {
    return 'AddWidget { widget: $_widget }';
  }
}

class RemoveWidget extends WidgetListEvent { /// Deshabilita la bateria

  final Widget _widget;
  RemoveWidget(this._widget) : super([_widget]);

  @override
  String toString() {
    return 'RemoveWidget { widget: $_widget }';
  }
}

class RemoveAll extends WidgetListEvent { /// Deshabilita la bateria

  @override
  String toString() {
    return 'RemoveAll ';
  }
}


class WidgetListState extends Equatable {
List<Widget> widgetList;

  WidgetListState({
    @required this.widgetList,
  }) : super([widgetList]);

  /// Valores iniciales
  factory WidgetListState.initial() {
    return WidgetListState(
      widgetList: new List<Widget>(),
    );
  }

  WidgetListState copyWith({
    List<Widget> widgetList
  }) {
    return WidgetListState(
      widgetList: widgetList ?? this.widgetList,
    );
  }
  @override
  String toString() {
    return 'WidgetListState { widgetList: $widgetList }';
  }
}
/// FIN  declaracion de STATE


class WidgetListUpdated extends WidgetListState {
  final List<Widget> widgetList;

  WidgetListUpdated({@required this.widgetList}) : assert(widgetList != null);

@override
List<Object> get props => [widgetList];
}

class WidgetListBloc extends Bloc <WidgetListEvent, WidgetListState> {
  WidgetListBloc();


  @override
  // TODO: implement initialState
  WidgetListState get initialState => WidgetListState.initial();

  @override
  Stream<WidgetListState> mapEventToState(WidgetListEvent event) async* {
    if (event is Empty) {
      yield WidgetListState.initial();
    } else if (event is AddWidget) {
        yield* _mapWidgetListToState(event,state);
    } else if (event is RemoveWidget){

    }
  }


  Stream<WidgetListState> _mapWidgetListToState(AddWidget event,WidgetListState state) async* {
    try {
      state.widgetList.add(event._widget);
      yield WidgetListUpdated(widgetList: state.widgetList);
    } catch (_) {
      yield state;
    }
  }

}
