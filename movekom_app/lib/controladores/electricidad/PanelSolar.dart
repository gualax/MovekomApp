import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/panel_solar_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/amperimetro.dart';

class PanelSolar extends StatelessWidget {
  final String title = "Panel solar";

  @override
  Widget build(BuildContext context) {
    final panelSolarBloc = BlocProvider.of<PanelSolarBloc>(context);
    return panel_solar_widget(panelSolarBloc);
  }

  Widget panel_solar_widget(cargador220Bloc) {
    return
      BlocBuilder<PanelSolarBloc,PanelSolarState>(
          builder: ( context, state) {
          return MyContainer(
            margin: EdgeInsets.all(5),
            width: 200,
            height: 210,
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
                        "assets/icons/solar_panel_1.svg", MyColors.principal,
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

