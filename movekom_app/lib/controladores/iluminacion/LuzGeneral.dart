
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luz_general_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LuzGeneral extends StatelessWidget {
  final String title = "Luz general ";
  final int widgetType;
  LuzGeneralBloc luzGeneralBloc;
  LuzGeneral(this.widgetType);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widgetType == 1){
      return luz_general_chico();
    }else{
      return luz_general_grande();
    }
  }

  Widget luz_general_grande(){
    return
      BlocBuilder<LuzGeneralBloc,LuzGeneralState>(
          builder: ( context, state) {
            luzGeneralBloc = BlocProvider.of<LuzGeneralBloc>(context);
          return MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 209,
            height: 140,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
            child: Stack(
              children: [
                MyPositioned.fill(
                  right: 20, bottom: 20,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconSvgD("assets/icons/todas_luces.svg", Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 75),
                  ),
                ),
                MyPositioned.fill(
                  left: 20, bottom: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/lampara.svg",  Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 55),
                  ),
                ),
                MyPositioned.fill(
                  bottom:  10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:  SC.hei(20),
                      child: SliderTheme(
                        data: sliderCustomTheme(context),
                        child: Slider(
                          value: state.valueDimer,
                          onChanged: (newValue) {
                            print(newValue);
                            luzGeneralBloc.add(Update(newValue));
                          },
                          min: 0,
                          max: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                MyPositioned.fill(
                  top:5 ,left: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title,style: MyTextStyle.estiloBold(19, MyColors.text),),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }



  Widget luz_general_chico(){
    Color color;
    String text;
    return
      BlocBuilder<LuzGeneralBloc,LuzGeneralState>(
          builder: ( context, state) {
            luzGeneralBloc = BlocProvider.of<LuzGeneralBloc>(context);
            if(state.isEnabled ){
              color = Colors.lightGreen;
              text = "ON";
            }else {
              color = Colors.grey;
              text = "OFF";
            }
            return GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  luzGeneralBloc.add(Disable());
                }else{
                  luzGeneralBloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(5)),
                width: 66,
                height: 137,
                decoration: new BoxDecoration(
                  color: MyColors.baseColor,
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        top: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: iconSvgD("assets/icons/luz.svg", color, 35),
                        )
                    ),MyPositioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/todas_luces.svg", color, 35),
                        )
                    ),MyPositioned.fill(
                        bottom: 8,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:   RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(20,color),
                                        text: text ),
                                  ]
                              )
                          ),
                        )
                    )
                  ],
                ),
              ),
            );
          }
      );
  }


} /// Fin clase
