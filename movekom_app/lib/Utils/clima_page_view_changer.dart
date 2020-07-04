
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/climatizacion/clima_page_bloc.dart';

class ClimaPageChanger {

  ClimaPageBloc tabBloc;

  ClimaPageChanger(BuildContext context){
    tabBloc = BlocProvider.of<ClimaPageBloc>(context);
  }

  changeTab(index){
    tabBloc.add(UpdateTab(index));
  }


}