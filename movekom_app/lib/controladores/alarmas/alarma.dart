import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/alarm_dialog.dart';
import 'package:movekomapp/blocs/alarma_blocs/alarma_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Alarma extends StatelessWidget {
  AlarmaBloc alarmaBloc;
  String on_off_text = "Pulsar para encender";
  String title = "ALARMA";
  int widgetType;

  Alarma(this.widgetType);

  @override
  Widget build(BuildContext context) {
    alarmaBloc = BlocProvider.of<AlarmaBloc>(context);
    if(widgetType == 1){
      return alarma();
    } else {
     return _alarma_ww();
    }
  }


  Widget alarma() {
    Color colorIcon, colorText,colorPower;
    return
      BlocBuilder<AlarmaBloc, AlarmaState>(
          builder: (context, state) {
            if (state.isEnabled) {
              on_off_text = "Pulsar para apagar";
              colorIcon = MyColors.principal;
              colorText = MyColors.text;
              colorPower = MyColors.principal;
            } else {
              colorIcon = MyColors.inactive;
              colorText = MyColors.inactive;
              colorPower = MyColors.text;
              on_off_text = "Pulsar para encender";
            }
            return GestureDetector(
              onTap: () {
                if (state.isEnabled) {
                  alarmaBloc.add(Disable());
                } else {
                  showDialog (
                    context: context,
                    builder: (BuildContext context) => AlarmDialog(),
                  );
                  alarmaBloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                height: 275,
                width: 422,
                color: MyColors.baseColor,
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                      top: 5, left: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(title,
                            style: MyTextStyle.estilo(18, colorText)),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(17, colorIcon),
                      ),
                    ),
                    MyPositioned.fill(
                      left: 120,bottom: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: iconSvgD(
                            "assets/icons/shield.svg",colorIcon, 130),
                      ),
                    ),
                    MyPositioned.fill(
                       right: 130, top: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: iconSvgD(
                            "assets/icons/parking.svg",colorIcon,
                            130),
                      ),
                    ),
                    MyPositioned.fill(
                      bottom: 17, right: 160,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: iconSvgD("assets/icons/on_off.svg", colorPower, 25)
                      ),
                    ),
                    MyPositioned.fill(
                      bottom: 17, left: 20,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(on_off_text,
                            style: MyTextStyle.estilo(15, colorText)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }



  Widget _alarma_ww() {
    return  GestureDetector(
      onTap: (){
      },
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 105.5,
        height: 140,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
                left: 10, top: 5, right: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: MyTextStyle.estilo(14, Colors.white),
                    textAlign:TextAlign.center,),
                )
            ),
            MyPositioned.fill(
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(10.0, MyColors.white),
                )
            ),
            MyPositioned.fill(
              left: 30,
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD(
                    "assets/icons/shield.svg",MyColors.white, 40),
              ),
            ),
            MyPositioned.fill(
                bottom: 20, right: 30,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: iconSvgD("assets/icons/parking.svg", MyColors.white, 40),
                )
            ),
          ],

        ),
      ),
    );
  }



}