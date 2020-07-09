
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_cocina_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LucesCocina extends StatelessWidget {
  final String title = "LUZ COCINA";
  int widgetType;
  LucesCocina(this.widgetType);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final lucesCocinaBloc = BlocProvider.of<LucesCocinaBloc>(context);
      int slideValue;
    if(widgetType == 1){
      return cocina_widget(lucesCocinaBloc);
    }else {
      return _luz_cocina_ww(lucesCocinaBloc);
    }
  }

  Widget cocina_widget(lucesCocinaBloc){
    return
      BlocBuilder<LucesCocinaBloc,LucesCocinaState>(
          builder: ( context, state) {
          return GestureDetector(
            onTap: (){
              if(state.isEnabled){
                lucesCocinaBloc.add(Disable());
              }else {
                lucesCocinaBloc.add(Enable());
              }
            },
            child: MyContainer(
              margin: EdgeInsets.all(SC.all(5)),
              width: 240 ,
              height: 175,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: [
                  MyPositioned.fill(
                    right: 20, bottom: 20,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: iconSvgD("assets/icons/kitchen.svg", Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 75),
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
                              lucesCocinaBloc.add(Update(newValue));
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
                          lucesCocinaBloc.add(Update(newVlue));
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


  Widget _luz_cocina_ww(lucesCocinaBloc){
    return
      BlocBuilder<LucesCocinaBloc,LucesCocinaState>(
          builder: ( context, state) {
            return MyContainer(
              margin: EdgeInsets.all(SC.all(7)),
              width: 225 ,
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
                      child: iconSvgD("assets/icons/kitchen.svg",MyColors.white, 75),
                    ),
                  ),
                  MyPositioned.fill(
                    left: 20, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/lampara.svg",  MyColors.white, 55),
                    ),
                  ),
                  MyPositioned.fill(
                    bottom:  10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height:  SC.hei(20),
                        child: SliderTheme(
                          data: sliderWWCustomTheme(context),
                          child: Slider(
                            value: state.valueDimer,
                            onChanged: (newValue) {
                           //   print(newValue);
                            //  lucesCocinaBloc.add(Update(newValue));
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
