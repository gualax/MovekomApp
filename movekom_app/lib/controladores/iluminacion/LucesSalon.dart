
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_salon_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LucesSalon extends StatefulWidget {
  int widgetType;

  LucesSalon(this.widgetType);
  _LucesSalonState createState() => _LucesSalonState();
}





class _LucesSalonState extends State<LucesSalon> {
  final String title = "LUZ SALON";

  @override
  Widget build(BuildContext context) {
    final lucesSalonBloc = BlocProvider.of<LucesSalonBloc>(context);

    if(widget.widgetType == 1){
      return bedroom_widget(lucesSalonBloc);
    }else {
      return _luz_bedroom_ww(lucesSalonBloc);
    }
  }


  Widget bedroom_widget(lucesSalonBloc){
    Color colorIcons;
    return
      BlocBuilder<LucesSalonBloc,LucesSalonState>(
          builder: ( context, state) {
            if ( state.isEnabled){
              colorIcons = MyColors.principal;
            } else {
              colorIcons = MyColors.inactive;
            }
          return GestureDetector(
            onTap: (){
              if(state.isEnabled){
                lucesSalonBloc.add(DisableLucesSalon());
              }else {
                lucesSalonBloc.add(EnableLucesSalon());
              }
            },
            child: MyContainer(
              margin: EdgeInsets.all(SC.all(5)),
              width: 240,
              height: 175,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: [
                  MyPositioned.fill(
                    right:20, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: iconSvgD("assets/icons/salon.svg", state.isEnabled ? MyColors.principal.withAlpha(state.valueDimer.round()+ 20): MyColors.inactive.withAlpha(100), 70),
                    ),
                  ),
                  MyPositioned.fill(
                    left: 30, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/lampara.svg", state.isEnabled ? MyColors.principal.withAlpha(state.valueDimer.round()+ 20): MyColors.inactive.withAlpha(100), 55),
                    ),
                  ),
                  MyPositioned.fill(
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height:  SC.hei(20),
                        child: SliderTheme(
                          data: sliderCustomTheme(context,colorIcons),
                          child: Slider(
                            value: state.isEnabled ? state.valueDimer : 0.0,
                            onChanged: (newValue) {
                              print(newValue);
                              lucesSalonBloc.add(UpdateLucesSalon(newValue,context));
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
                  MyPositioned.fill(
                    top:5 ,left: 5,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onHorizontalDragUpdate: (dragValue){
                          print(dragValue);
                          double newVlue = state.valueDimer + (dragValue.delta.dx * Constants.SLIDER_DRAG_FACTOR);
                          lucesSalonBloc.add(UpdateLucesSalon(newVlue,context));
                        },
                        child: MyContainer(
                          color: Colors.transparent,
                          width: 240 ,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _luz_bedroom_ww(lucesSalonBloc){
    return
      BlocBuilder<LucesSalonBloc,LucesSalonState>(
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
                        child: iconSvgD("assets/icons/salon.svg", MyColors.white, 70),
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
