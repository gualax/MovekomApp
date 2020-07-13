import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/climatizacion/calefaccion_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWCalefaccion extends StatefulWidget {
  bool isAdded;
  WWCalefaccion(this.isAdded);

  @override
  _WWCalefaccionState createState() => _WWCalefaccionState();
}

class _WWCalefaccionState extends State<WWCalefaccion> {
  String title = "CALEFACCION";
  CalefaccionBloc calefaccionBloc;

  @override
  Widget build(BuildContext context) {
    calefaccionBloc = BlocProvider.of<CalefaccionBloc>(context);
    if(widget.isAdded){
      return _ww_calefaccionA();
    } else {
      return _ww_calefaccionI();
    }
  }

  Widget _ww_calefaccionA(){
    Color color = MyColors.white;
    Color colorText = MyColors.white;
    return BlocBuilder<CalefaccionBloc, CalefaccionState>(
        builder: ( context, state) {
            if(state.isEnabled){
              color = Colors.lightGreenAccent;
              colorText = MyColors.text;
            } else {
              color = MyColors.inactive;
              colorText = MyColors.inactive;
            }
        return GestureDetector(
          onTap: () {
            if(state.isEnabled) {
              calefaccionBloc.add(DisableCalefaccion());
            }else {
              calefaccionBloc.add(EnableCalefaccion());
            }
          },
          onLongPress: (){
            TabChanger tabChanger =  TabChanger(context);
            tabChanger.changeTab(Constants.PAGE_WHEATER);
          },
          child: MyContainer(
              margin: EdgeInsets.all(SC.all(7)),
              width: 225,
              height: 140,
              decoration: BoxDecoration(
                  color:  MyColors.baseColor
              ),
              child: Stack(children: [
                // Valvulas (Todas)
                MyPositioned.fill(  ///titulo
                  top: 4,
                  left: 8,
                  child:   Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: MyTextStyle.estiloBold(18,colorText),
                    ),
                  ),
                ),
                MyPositioned.fill(/// circulito
                    top: 10, right: 10,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: circuloConSombra(17.0, color),
                    )
                ),
                MyPositioned.fill(  ///textAbajoDer
                  right: 8,
                  bottom: 6,
                  child:  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Consumo " + "2.65" + "A",
                      style: MyTextStyle.estilo(18, colorText),
                    ),
                  ),
                ),
                MyPositioned.fill(  ///icon
                  left: 25,
                  child:  Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/fire.svg", color, 75),
                  ),
                ),
                MyPositioned.fill(  ///textValue
                  right: 20,
                  child:  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.valueTemp.toString() + "ºC",
                      style: MyTextStyle.estiloBold(45, colorText),
                    ),
                  ),
                )
              ])
          ),
        );
      }
  );
  }



  Widget _ww_calefaccionI() {
    Color color = MyColors.white;
    Color colorText = MyColors.white;
    return BlocBuilder<CalefaccionBloc, CalefaccionState>(
        builder: (context, state) {
          return MyContainer(
              margin: EdgeInsets.all(SC.all(7)),
              width: 225,
              height: 140,
              decoration: BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(children: [
                // Valvulas (Todas)
                MyPositioned.fill(

                  ///titulo
                  top: 4,
                  left: 8,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: MyTextStyle.estiloBold(18, colorText),
                    ),
                  ),
                ),
                MyPositioned.fill(

                  /// circulito
                    top: 10, right: 10,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: circuloConSombra(17.0, color),
                    )
                ),
                MyPositioned.fill(

                  ///textAbajoDer
                  right: 8,
                  bottom: 6,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Consumo " + "2.65" + "A",
                      style: MyTextStyle.estilo(18, colorText),
                    ),
                  ),
                ),
                MyPositioned.fill(

                  ///icon
                  left: 25,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/fire.svg", color, 75),
                  ),
                ),
                MyPositioned.fill(

                  ///textValue
                  right: 20,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.valueTemp.toString() + "ºC",
                      style: MyTextStyle.estiloBold(45, colorText),
                    ),
                  ),
                )
              ])
          );
        }
    );
  }
}
