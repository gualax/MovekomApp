import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_cocina_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';

class WWLucesCocina extends StatelessWidget {

  bool isAdded;
  String title = "LUZ EXTERIOR";
  WWLucesCocina(this.isAdded);

  LucesCocinaBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LucesCocinaBloc>(context);
    return _luz_cocina_ww();
  }



  Widget _luz_cocina_ww(){
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    return
      BlocBuilder<LucesCocinaBloc,LucesCocinaState>(
          builder: ( context, state) {
            if(isAdded) {
              if (state.isEnabled) {
                colorIcon = MyColors.principal;
                colorTxt = MyColors.text;
              } else {
                colorIcon = MyColors.inactive;
                colorTxt = MyColors.inactive;
              }
            }
            return InkWell(
              splashColor: MyColors.principal,
              onTap: (){
                if (state.isEnabled) {
                  bloc.add(DisableCocina());
                } else {
                  bloc.add(EnableCocina());
                }
              },
              onLongPress: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(Constants.PAGE_LIGHTS);
              },
              child: MyContainer(
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
                        child: iconSvgD("assets/icons/kitchen.svg",colorIcon, 75),
                      ),
                    ),
                    MyPositioned.fill(
                      left: 20, bottom: 10,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/lampara.svg",colorIcon, 55),
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
                        child: Text(title,style: MyTextStyle.estilo(18,colorTxt),),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }


}
