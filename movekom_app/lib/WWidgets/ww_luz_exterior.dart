import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_parque_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWLuzExt extends StatefulWidget {
  bool isAdded;

  WWLuzExt(this.isAdded);
  @override
  _WWLuzExtState createState() => _WWLuzExtState();
}

class _WWLuzExtState extends State<WWLuzExt> {
  LucesExteriorBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LucesExteriorBloc>(context);
    return luz_ext_ww();
  }


  Widget luz_ext_ww(){
    String on_off = "--";
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    return
      BlocBuilder<LucesExteriorBloc,LucesExteriorState>(
       builder: ( context, state) {
         if(widget.isAdded) {
           if (state.isEnabled) {
             colorIcon = MyColors.principal;
             colorTxt = MyColors.text;
             on_off = "ON";
           } else {
             colorIcon = MyColors.inactive;
             colorTxt = MyColors.inactive;
             on_off = "OFF";
           }
         }
      return InkWell(
        splashColor: MyColors.principal,
        onTap: (){
          if (state.isEnabled) {
            bloc.add(Disable());
          } else {
            bloc.add(Enable());
          }
        },
        onLongPress: (){
          TabChanger tabChanger =  TabChanger(context);
          tabChanger.changeTab(Constants.PAGE_LIGHTS);
        },
        child: MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 66,
        height: 140,
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              top: 10,
              child:  Align(
                alignment: Alignment.topCenter,
                child: iconSvgD("assets/icons/lampara.svg",colorIcon, 30),
              ),
            ),
            MyPositioned.fill(
              child:  Align(
                alignment: Alignment.center,
                child: iconSvgD("assets/icons/park.svg", colorIcon, 40),
              ),
            ),
            MyPositioned.fill(
              bottom: 10,
              child:  Align(
                alignment: Alignment.bottomCenter,
                child: Text(on_off,
                    style: MyTextStyle.estilo(14, colorTxt)),
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
