import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/panel_solar_bloc.dart';
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
          return Container(
            margin: EdgeInsets.all(5),
            width: 200,
            height: 214,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  right: 10,
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: amperimetroImg(state.valueAmp, 30.0),
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title,
                        style: MyTextStyle.estiloBold(20, Colors.white)),
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        state.valueAmp.toString(),
                        style: MyTextStyle.estiloBold(55, Colors.white)),
                  ),
                ),
                Positioned.fill(
                  top: 85,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Ah", style: MyTextStyle.estiloBold(30, Colors.white)),
                  ),
                ),
                Positioned.fill(
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: iconSvgD(
                        "assets/icons/solar_panel_1.svg", Colors.lightGreenAccent,
                        30.0),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

}/// FIN clase

