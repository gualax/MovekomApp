import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/blocs/electricidad_blocs/consumos_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/indicador_rojo.dart';

class Consumos extends StatelessWidget {
  final String title = "Consumo instantaneo";

  @override
  Widget build(BuildContext context) {
    final consumosBloc = BlocProvider.of<ConsumosBloc>(context);
    return consumos(consumosBloc);
  }

  Widget consumos(consumosBloc) {
    Color colorIcon;
    String textIcon;
    return
      BlocBuilder<ConsumosBloc,ConsumosState>(
        builder: ( context, state) {
          if(state.isEnabled){
            textIcon = "Apagar los consumos";
            colorIcon = MyColors.principalColor;
          }else{
            textIcon = "Encender los consumos";
            colorIcon = MyColors.textColor;
          }
          return MyContainer(
            margin: EdgeInsets.all(5),
            width: 200,
            height: 214,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  bottom: 25,
                  right: 15,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: iconSvgD(
                        "assets/icons/electricidad.svg", colorIcon, 35),
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title,
                        style: MyTextStyle.estiloBold(15, MyColors.textColor)),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        state.valueAmp.toString(),
                        style: MyTextStyle.estiloBold(40, MyColors.textColor)),
                  ),
                ),
                Positioned.fill(
                  top: 55,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Ah", style: MyTextStyle.estiloBold(25, MyColors.textColor)),
                  ),
                ),
                Positioned.fill(
                    bottom: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: inidicadorRojoImg(state.valueAmp, 10.0),
                    )
                ),
                Positioned.fill(
                    left: 5, bottom: 5,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        icon: Icon(Icons.power_settings_new), iconSize: 30,
                        color:colorIcon,
                        onPressed: () {
                          if(state.isEnabled){
                            consumosBloc.add(DisableInversor());
                          }else{
                            consumosBloc.add(EnableInversor());
                          }
                        },),
                    )
                ),
                Positioned.fill(
                    bottom: 20, left: 15,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(textIcon,
                      style: MyTextStyle.estilo(12, MyColors.textColor),),
                    )
                ),
              ],
            ),
          );
        }
    );
  }

}/// FIN clase



