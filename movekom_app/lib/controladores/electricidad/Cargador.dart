
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_220.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/amperimetro.dart';

class Cargador220 extends StatelessWidget {
  final String title = "CARGADOR";
  int widgetType;
  Cargador220(this.widgetType);

  @override
  Widget build(BuildContext context) {
    final cargador220Bloc = BlocProvider.of<Cargador220Bloc>(context);

    if(widgetType == 1){
      return cargador220_widget(cargador220Bloc);
    }else {
      return cargador220_box(12.5.toString(),context);
    }
  }

  Widget cargador220_widget(cargador220Bloc) {
    return
      BlocBuilder<Cargador220Bloc,Cargador220State>(
          builder: ( context, state) {
          return MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 200,
            height: 198,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                  right: 10,
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: amperimetroImg(state.valueAmp, SC.all(30)),
                  ),
                ),
                MyPositioned.fill(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(title,
                        style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, MyColors.text)),
                  ),
                ),
                MyPositioned.fill(
                  top: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        state.valueAmp.toString(),
                        style: MyTextStyle.estiloBold(55, MyColors.text)),
                  ),
                ),
                MyPositioned.fill(
                  top: 85,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Ah", style: MyTextStyle.estiloBold(30, MyColors.text)),
                  ),
                ),
                MyPositioned.fill(
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: iconSvgD(
                        "assets/icons/energy_2.svg", MyColors.principal,
                        30),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }


  Widget cargador220_box(valueAh,context){
    return GestureDetector(
      onTap: (){
        TabChanger tabChanger = new TabChanger(context);
        tabChanger.changeTab(2);
      },
      child: MyContainer(
          margin: EdgeInsets.all(SC.all(4)),
          width: 100,
          height: 89,
          decoration: new BoxDecoration(
              color: MyColors.baseColor
          ), child: Stack(children: [
        MyPositioned.fill( /// titulo
          top: 4,
          child: Align(
            alignment: Alignment.topCenter,
            child:Text(
              "220",
              style:MyTextStyle.estiloBold(16, MyColors.text),
            ),
          ),
        ),
        MyPositioned.fill(
          top:10,
          child: Align(
            alignment: Alignment.center,
            child: Text(valueAh,
              style:MyTextStyle.estiloBold(20, MyColors.principal),
            ),
          ),
        ),
      ])
      ),
    );
  }
}/// FIN clase

