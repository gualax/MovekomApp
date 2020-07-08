
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/list_rebuild_bloc.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux1.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/Cargador.dart';
import 'package:movekomapp/controladores/electricidad/PanelSolar.dart';
import 'package:movekomapp/controladores/electricidad/Totalizador.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/principal_widgets_list.dart';


class PrincipalHome extends StatefulWidget {
  @override
  _PrincipalHomeState createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {

  List<Widget> carouselList = new List();
  List<String> lista = new List();
  CarouselSlider instance;
  BuildContext mContext;

  @override
  void initState() {
    print("*** *- initState  *** *-");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("*** *- Principal build  *** *-");
    mContext = context;
    return
      Scaffold(
          resizeToAvoidBottomPadding: false,
         // backgroundColor: Colors.black,
        body: principalBody(),
      );
  }


  Widget principalBody(){
  return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            contenido(),
            principalWidListReb(),
          ],
  );
}


Widget principalWidListReb(){
  return
    BlocBuilder<ListRebuildBloc,ListRebuildState>(
        builder: ( context, state) {
          print("state changed");
          print(state.valueDimer);
          return  PrincipalWidgetsList();
        });
}

  Widget contenido(){
    return MyContainer(
   //   margin: EdgeInsets.only(top: SC.top(20)),
      child: Row( /// elementos uno al lado del otro
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BateriaMotor(1),
          Totalizador(1),
          BateriaMotorAux1(1),
          columns(),
          AguasLimpias(1),
          AguasSucias(1),
        ],
      ),
    );
  }



  Widget columns(){
    return
      MyContainer(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BateriaMotor(3),
            PanelSolar(3),
            Cargador220(2),
          ],
        ),
      );
  }





}

