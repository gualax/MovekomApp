import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/mode1_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/mode2_bloc.dart';

double getValueUpdate(value){
  if (value >= 200){
    return 200;
  }else if (value <= 0){
    return 0;
  }
  return value;
}

void disableModes(context) {
  print("SEND DISABLE");
  final mode1 = BlocProvider.of<Mode1Bloc>(context);
  final mode2 = BlocProvider.of<Mode2Bloc>(context);

  if(mode1.state.isEnabled)
        mode1.add(DisableMode1());

  if(mode2.state.isEnabled)
        mode2.add(DisableMode2());
}

void disableMode1(context) {
  print("SEND DISABLE");
  final mode1 = BlocProvider.of<Mode1Bloc>(context);

  if(mode1.state.isEnabled)
    mode1.add(DisableMode1());

}

void disableMode2(context) {
  print("SEND DISABLE");
  final mode2 = BlocProvider.of<Mode2Bloc>(context);

  if(mode2.state.isEnabled)
    mode2.add(DisableMode2());
}