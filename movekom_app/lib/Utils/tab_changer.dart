
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/tab_bloc.dart';

class TabChanger {

  TabBloc tabBloc;

  TabChanger(BuildContext context){
    tabBloc = BlocProvider.of<TabBloc>(context);
  }

    changeTab(index){
    tabBloc.add(UpdateTab(index));
  }


}