import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/mode2_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';



class ModoLuz2 extends StatelessWidget {
  String title1;
  String title2;
final int widgetType;
  Mode2Bloc mode2bloc;

  ModoLuz2(this.widgetType);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    title1 = "GUARDAR MODO 2";
    title2 = "MODO 2";
    mode2bloc =  BlocProvider.of<Mode2Bloc>(context);

    if(widgetType  == 1){
      return save_modo_luz_2();
    }else if(widgetType == 2){
      return modo_luz_2();
    } else {
      return _modo_luz_2_ww();
    }
  }

  Widget save_modo_luz_2() {
    return
      BlocBuilder<Mode2Bloc, Mode2State>(
          builder: (context, state) {
            return InkWell(
              splashColor: MyColors.principal,
              onTap: () {
                mode2bloc.add(SaveMode2(context));
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


  Widget modo_luz_2(){
    Color colorIcon;
    return
      BlocBuilder<Mode2Bloc,Mode2State> (
          builder: ( context, state) {
            Mode2Bloc mode2bloc = BlocProvider.of<Mode2Bloc>(context);
            if (state.isEnabled){
            colorIcon = MyColors.principal;
          } else {
            colorIcon = MyColors.inactive;
          }
    return InkWell(
      splashColor: MyColors.principal,
      onTap: (){
        if(state.isEnabled){
          mode2bloc.add(DisableMode2());
        } else {
          mode2bloc.add(LoadMode2(context));
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


  Widget _modo_luz_2_ww(){
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