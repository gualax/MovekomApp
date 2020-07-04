
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luz_general_bloc.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LuzGeneral extends StatelessWidget {
  final String title = "LUZ GENERAL ";
  final int widgetType;
  LuzGeneralBloc luzGeneralBloc;
  LuzGeneral(this.widgetType);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widgetType == 1){
      return luz_general_chico();
    }else if(widgetType == 2){
      return luz_general_grande();
    } else{
      return _luz_general_ww();
    }
  }

  Widget luz_general_grande(){
    return
      BlocBuilder<LuzGeneralBloc,LuzGeneralState>(
          builder: ( context, state) {
            luzGeneralBloc = BlocProvider.of<LuzGeneralBloc>(context);
          return MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 125,
            height: 150,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
            child: Stack(
              children: [
                MyPositioned.fill(
                   top: 20,
                  child: Align(
                    alignment: Alignment.center,
                    child: iconSvgD("assets/icons/lampara.svg",  Colors.grey, 55),
                  ),
                ),
                MyPositioned.fill(
                  top:5 ,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(title,style: MyTextStyle.estilo(17, MyColors.text),
                    textAlign: TextAlign.center,),
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


  Widget _luz_general_ww(){
    return
      BlocBuilder<LuzGeneralBloc,LuzGeneralState>(
          builder: ( context, state) {
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
                    right:20, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: iconSvgD("assets/icons/todas_luces.svg", MyColors.white, 70),
                    ),
                  ),
                  MyPositioned.fill(
                    left: 30, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/lampara.svg", MyColors.white, 55),
                    ),
                  ),
                  MyPositioned.fill(
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height:  SC.hei(20),
                        child: SliderTheme(
                          data: sliderWWCustomTheme(context),
                          child: Slider(
                            value: state.valueDimer,
                            onChanged: (newValue) {
                              // print(newValue);
                              // lucesSalonBloc.add(Update(newValue));
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
                      child: Text(title,style: MyTextStyle.estilo(18, MyColors.text),),
                    ),
                  ),
                ],
              ),
            );
          }
      );
  }




} /// Fin clase
