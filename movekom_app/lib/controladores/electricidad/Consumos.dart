import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/consumos_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/indicador_rojo.dart';

class Consumos extends StatelessWidget {
  final String title = "CONSUMO SISTEMA";

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
            textIcon = "APAGAR TODO";
            colorIcon = MyColors.principal;
          }else{
            textIcon = "ENCENDER TODO";
            colorIcon = MyColors.text;
          }
          return GestureDetector(
            onTap: (){
              if(state.isEnabled){
                consumosBloc.add(DisableInversor());
              }else{
                consumosBloc.add(EnableInversor());
              }
            },
            child: MyContainer(
              margin: EdgeInsets.all(SC.all(5)),
              width: 200,
              height: 204,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                    bottom: 25,
                    right: 15,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: iconSvgD(
                          "assets/icons/electricidad.svg", colorIcon, 35),
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          state.valueAmp.toString(),
                          style: MyTextStyle.estiloBold(40, MyColors.text)),
                    ),
                  ),
                  MyPositioned.fill(
                    top: 55,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          "A", style: MyTextStyle.estiloBold(25, MyColors.text)),
                    ),
                  ),
                  MyPositioned.fill(
                      bottom: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: inidicadorRojoImg(state.valueAmp,SC.all(10)),
                      )
                  ),
                  MyPositioned.fill(
                      right: 140, bottom: 20,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: iconSvgD("assets/icons/on_off.svg", colorIcon, 20),
                      )
                  ),
                  MyPositioned.fill(
                      bottom: 20, left: 15,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(textIcon,
                        style: MyTextStyle.estilo(15, MyColors.text),),
                      )
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

}/// FIN clase



