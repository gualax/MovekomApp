
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_220.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/amperimetro.dart';

class Cargador220 extends StatelessWidget {
  final String title = "Cargador 220 ";
  @override
  Widget build(BuildContext context) {
    final cargador220Bloc = BlocProvider.of<Cargador220Bloc>(context);
    return cargador220_widget(cargador220Bloc);
  }

  Widget cargador220_widget(cargador220Bloc) {
    return
      BlocBuilder<Cargador220Bloc,Cargador220State>(
          builder: ( context, state) {
          return MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 200,
            height: 204,
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
                    alignment: Alignment.topLeft,
                    child: Text(title,
                        style: MyTextStyle.estiloBold(20, MyColors.text)),
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

}/// FIN clase

