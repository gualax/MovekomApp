import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/mode1_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';



class ModoLuz1 extends StatelessWidget {
  String title1;
  String title2;
final int widgetType;
  Mode1Bloc mode1bloc;

ModoLuz1(this.widgetType);

  @override
  Widget build(BuildContext context) {
    title1 = "GUARDAR MODO 1";
    title2 = "MODO 1";
    mode1bloc =  BlocProvider.of<Mode1Bloc>(context);
    if(widgetType == 1){
      return save_modo_luz_1();
    }else if(widgetType == 2){
      return modo_luz_1();
    } else {
      return _modo_luz_1_ww();
    }

  }

  Widget save_modo_luz_1() {
    return
      BlocBuilder<Mode1Bloc, Mode1State>(
          builder: (context, state) {
            return InkWell(
              splashColor: MyColors.principal,
              onTap: () {
                mode1bloc.add(SaveMode1(context));
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(5)),
                width: 98,
                height: 175,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        top: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgNc("assets/icons/save_green.svg", 45),
                        )
                    ),
                    MyPositioned.fill(
                        top: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(title1,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.estilo(15, Colors.white),),
                        )
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }



  Widget modo_luz_1(){
    Color colorIcon;
    return
      BlocBuilder<Mode1Bloc,Mode1State> (
       builder: ( context, state) {
         Mode1Bloc mode1bloc = BlocProvider.of<Mode1Bloc>(context);
         if(state.isEnabled){
        colorIcon = MyColors.principal;
      } else {
        colorIcon = MyColors.inactive;
      }

    return InkWell(
      splashColor: MyColors.principal,
      onTap: (){
        if(state.isEnabled){
          mode1bloc.add(DisableMode1());
        } else {
          mode1bloc.add(LoadMode1(context));
        }
      },
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(5)),
        width: 160,
        height: 175,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Stack(
          children: [
            MyPositioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD("assets/icons/letter_m.svg", colorIcon, 90),
              ),
            ),
            MyPositioned.fill(
                top: 10, left: 10,
                child: Text(title2,
                    style:MyTextStyle.estilo(18, MyColors.text))
            ),
            MyPositioned.fill(
              right: 10, top: 10,
              child: Align(
                alignment: Alignment.topRight,
                child: circuloConSombra(15, colorIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
      );
  }




  Widget _modo_luz_1_ww(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 225,
      height: 140,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: [
          MyPositioned.fill(
            top: 20, right: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: iconSvgD("assets/icons/letter_m.svg",MyColors.white, 70),
            ),
          ),
          MyPositioned.fill(
            top: 20, left: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: iconSvgD("assets/icons/lampara.svg",MyColors.white, 60),
            ),
          ),
          MyPositioned.fill(
              top: 10, left: 10,
              child: Text(title2,
                  style:MyTextStyle.estilo(18, MyColors.text))
          ),
          MyPositioned.fill(
              right: 10, top: 10,
              child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(15, MyColors.white))
          ),
        ],
      ),
    );
  }


}