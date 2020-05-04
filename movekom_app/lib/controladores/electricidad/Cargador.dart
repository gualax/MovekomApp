
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/cargador_220.dart';
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
    return BlocBuilder(
        bloc: cargador220Bloc,
        builder: (BuildContext context, Cargador220State state) {
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
                        "assets/icons/energy_2.svg", Colors.lightGreenAccent,
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

