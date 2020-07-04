
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_panel_solar_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoPanelSolar extends StatelessWidget {
  String title = "MODO PANEL SOLAR";
  String description = "Utiliza solo energía proveniente de energías renovables como la solar o la eólica.";

  int widgetType;
  ModoPanelSolar(this.widgetType);

  @override
  Widget build(BuildContext context) {

    if(widgetType == 1){
      return modo_panel_solar();
    } else {
      return _modo_panel_solar_ww();
    }
  }


  Widget modo_panel_solar() {
    Color colorIcon,colorIndic;
    String on_off_text;
    return
      BlocBuilder<ModoPanelSolarBloc,ModoPanelSolarState>(
          builder: ( context, state) {
            final bloc = BlocProvider.of<ModoPanelSolarBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
              on_off_text = "Pulsar para apagar";
            }else{
              colorIcon = Colors.white;
              colorIndic = Colors.grey;
              on_off_text = "Pulsar para encender";
            }
            return  GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  bloc.add(Disable());
                }else{
                  bloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.only(top: SC.top(5), bottom: SC.bot(5), left: SC.left(15), right: SC.right(15)),
                width: 210,
                height: 230,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        left: 10, top: 5,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title, style: MyTextStyle.estilo(16, Colors.white),),
                        )
                    ),
                    MyPositioned.fill(
                        top: 10, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: circuloConSombra(17.0, colorIndic),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 75,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/solar_panel_1.svg", colorIndic, 55),
                        )
                    ),
                    MyPositioned.fill(
                        left: 30, bottom: 13,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: iconSvgD("assets/icons/on_off.svg", colorIcon, 20),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 15, left: 15,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(on_off_text,
                            style: MyTextStyle.estilo(12, Colors.white),),
                        )
                    ),
                    MyPositioned.fill(
                        top: 75, left: 10, right: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(description,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.estilo(13, Colors.white),),
                        )
                    ),
                  ],

                ),
              ),
            );
          });
  }



  Widget _modo_panel_solar_ww() {
    return
      BlocBuilder<ModoPanelSolarBloc,ModoPanelSolarState>(
          builder: ( context, state) {
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
                            "MODO SOLAR",
                            style: MyTextStyle.estilo(14, Colors.white),
                            textAlign:TextAlign.center ,),
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
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: iconSvgD("assets/icons/solar_panel_1.svg", MyColors.white, 50),
                        )
                    ),
                  ],

                ),
              ),
            );
          });
  }

}