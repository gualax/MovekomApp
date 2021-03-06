
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_parque_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LucesExterior extends StatelessWidget {
  final String title = "LUZ EXTERIOR";
  LucesExteriorBloc lucesCocinaBloc;
  final int widgetType;
  LucesExterior(this.widgetType);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widgetType == 1){
      return exterior_chico();
    }else if (widgetType == 2) {
      return exterior_grande();
    }else {
      return exterior_ww();
    }
  }

  Widget exterior_grande(){
    Color colorIcons;
    return
      BlocBuilder<LucesExteriorBloc,LucesExteriorState>(
          builder: ( context, state) {
            lucesCocinaBloc = BlocProvider.of<LucesExteriorBloc>(context);
            if ( state.isEnabled){
              colorIcons = MyColors.principal;
            } else {
              colorIcons = MyColors.inactive;
            }
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
              width: 240,
              height: 175,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: [
                  MyPositioned.fill(
                    right: 30, bottom: 30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: iconSvgD("assets/icons/park.svg", state.isEnabled ? MyColors.principal.withAlpha(state.valueDimer.round()+ 20): MyColors.inactive.withAlpha(100), 85),
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
                    bottom:  10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height:  SC.hei(20),
                        child: SliderTheme(
                          data: sliderCustomTheme(context,colorIcons),
                          child: Slider(
                            value: state.isEnabled ? state.valueDimer : 0.0,
                            onChanged: (newValue) {
                              //   print(newValue);
                              lucesCocinaBloc.add(UpdateLucesExterior(newValue,context));
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
                          lucesCocinaBloc.add(UpdateLucesExterior(newVlue,context));
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



  Widget exterior_chico(){
    Color color;
    String text;
    return
      BlocBuilder<LucesExteriorBloc,LucesExteriorState>(
      builder: ( context, state) {
      lucesCocinaBloc = BlocProvider.of<LucesExteriorBloc>(context);
      if(state.isEnabled ){
        color = MyColors.principal;
        text = "ON";
      }else {
        color = Colors.grey;
        text = "OFF";
      }
      return GestureDetector(
        onTap: (){
            if(state.isEnabled){
              lucesCocinaBloc.add(Disable());
            }else{
              lucesCocinaBloc.add(Enable());
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
                    child: iconSvgD("assets/icons/exterior.svg", color, 35),
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



  Widget exterior_ww(){
    return
      BlocBuilder<LucesExteriorBloc,LucesExteriorState>(
          builder: ( context, state) {
            lucesCocinaBloc = BlocProvider.of<LucesExteriorBloc>(context);
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
                    right: 30, bottom: 30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: iconSvgD("assets/icons/park.svg", MyColors.text, 85),
                    ),
                  ),
                  MyPositioned.fill(
                    left: 30, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/lampara.svg",  MyColors.text, 55),
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
                              //lucesCocinaBloc.add(Update(newValue));
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
