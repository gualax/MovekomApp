
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_habitacion_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LigthsBedroom extends StatelessWidget {
  final String title = "LUZ HABITACION";
  int widgetType;

  LigthsBedroom(this.widgetType);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final ligthBedroomBloc = BlocProvider.of<LucesHabitacionBloc>(context);

    if(widgetType == 1){
      return bedroom_widget(ligthBedroomBloc);
    } else {
      return _luz_bedroom_ww(ligthBedroomBloc);
    }
  }


  Widget _luz_bedroom_ww(ligthBedroomBloc){
    return
      BlocBuilder<LucesHabitacionBloc,LucesHabitacionState>(
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
                right: 30,bottom: 20,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: iconSvgD("assets/icons/bedroom.svg",MyColors.white, 70),
                ),
              ),
              MyPositioned.fill(
                left: 30, bottom: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD("assets/icons/lampara.svg",MyColors.white, 55),
                ),
              ),
              MyPositioned.fill(
                bottom:  10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height:  SizeConfig.v * 3.2,
                    child: SliderTheme(
                      data: sliderWWCustomTheme(context),
                      child: Slider(
                        value: state.valueDimer,
                        onChanged: (newValue) {
                        //  print(newValue);
                        //  ligthBedroomBloc.add(Update(newValue));
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

  Widget bedroom_widget(ligthBedroomBloc){
    Color colorIcons;
    return
      BlocBuilder<LucesHabitacionBloc,LucesHabitacionState>(
          builder: ( context, state) {
            if ( state.isEnabled){
              colorIcons = MyColors.principal;
            } else {
              colorIcons = MyColors.inactive;
            }
            return GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  ligthBedroomBloc.add(DisableLucesHabitacion());
                }else {
                  ligthBedroomBloc.add(EnableLucesHabitacion());
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
                      right: 30,bottom: 20,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: iconSvgD("assets/icons/bedroom.svg", state.isEnabled ? MyColors.principal.withAlpha(state.valueDimer.round()+ 20): MyColors.inactive.withAlpha(100), 70),
                      ),
                    ),
                    MyPositioned.fill(
                      left: 30, bottom: 10,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/lampara.svg",  state.isEnabled ? MyColors.principal.withAlpha(state.valueDimer.round()+ 20): MyColors.inactive.withAlpha(100), 55),
                      ),
                    ),
                    MyPositioned.fill(
                      bottom:  10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height:  SizeConfig.v * 3.2,
                          child: SliderTheme(
                            data: sliderCustomTheme(context,colorIcons),
                            child: Slider(
                              value:  state.isEnabled ? state.valueDimer : 0.0,
                              onChanged: (newValue) {
                                //  print(newValue);
                                ligthBedroomBloc.add(UpdateLucesHabitacion(newValue,context));
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
                            ligthBedroomBloc.add(UpdateLucesHabitacion(newVlue,context));
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

} /// Fin clase
