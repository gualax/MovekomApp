
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SettingsEvent {
  final dynamic payload;
  SettingsEvent(this.payload);
}
class FontSize extends SettingsEvent {
  FontSize(double payload) : super(payload);
}
class Bold extends SettingsEvent {
  Bold(bool payload) : super(payload);
}
class Italic extends SettingsEvent {
  Italic(bool payload) : super(payload);
}


@immutable
abstract class SettingsState {
  final double sliderFontSize;
  final bool isBold;
  final bool isItalic;

  SettingsState({this.sliderFontSize, this.isBold, this.isItalic});
  double get fontSize => sliderFontSize * 30;
}
class InitialSettingsState extends SettingsState {
  InitialSettingsState()
      : super(sliderFontSize: 0.5, isBold: false, isItalic: false);
}
class NewSettingState extends SettingsState {
  NewSettingState.fromOldSettingState(SettingsState oldState,
      {double sliderFontSize, bool isBold, bool isItalic})
      : super(
    sliderFontSize: sliderFontSize ?? oldState.sliderFontSize,
    isBold: isBold ?? oldState.isBold,
    isItalic: isItalic ?? oldState.isItalic,
  );
}


class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => InitialSettingsState();


  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FontSize) {
      yield NewSettingState.fromOldSettingState(state,
          sliderFontSize: event.payload);
    } else if (event is Bold) {
      yield NewSettingState.fromOldSettingState(state,
          isBold: event.payload);
    } else if (event is Italic) {
      yield NewSettingState.fromOldSettingState(state,
          isItalic: event.payload);
    }
  }
}