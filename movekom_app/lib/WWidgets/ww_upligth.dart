import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/upligth_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWLuzUpligth extends StatefulWidget {

  bool isAdded;

  WWLuzUpligth(this.isAdded);
  @override
  _WWLuzUpligthState createState() => _WWLuzUpligthState();
}

class _WWLuzUpligthState extends State<WWLuzUpligth> {

  UpligthBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<UpligthBloc>(context);
    return luz_uplight_ww();
  }


  Widget luz_uplight_ww(){
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    String on_off = "--";
    return
      BlocBuilder<UpligthBloc,UplightState>(
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
              bloc.add(DisableUplight());
            } else {
              bloc.add(EnableUplight());
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
                    child: Text("LED",
                        style: MyTextStyle.estiloBold(14, colorIcon)),
                  ),
                ),
                MyPositioned.fill(
                  child:  Align(
                    alignment: Alignment.center,
                    child: iconSvgD("assets/icons/tira_led.svg",colorIcon, 40),
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