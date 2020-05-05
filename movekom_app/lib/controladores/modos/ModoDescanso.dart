
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_descanso_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoDescanso extends StatelessWidget {
  String title = "MODO DESCANSO";
  String description = "Elimina los ruidos nocturnos del compresor de la nevera, y desactiva bomba de agua, inversor.. etc.";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_descanso();
  }


  Widget modo_descanso() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoDescansoBloc,ModoDescansoState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoDescansoBloc>(context);
            if(state.isEnabled){
              colorIcon = Colors.lightGreenAccent;
              colorIndic = Colors.lightGreenAccent;
            }else{
              colorIcon = Colors.white;
              colorIndic = Colors.grey;
            }

            return Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              width: SizeConfig.h * 17,
              height: SizeConfig.v * 34,
              decoration: new BoxDecoration(
                  color: MyColors.ContainerColor
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      left: 10, top: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title, style: MyTextStyle.estilo(17, Colors.white),),
                      )
                  ),
                  Positioned.fill(
                      top: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(17.0, colorIndic),
                      )
                  ),
                  Positioned.fill(
                      bottom: 75, left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/modo_descanso.svg", colorIndic, 55),
                      )
                  ),
                  Positioned.fill(
                      left: 10,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(Icons.power_settings_new),
                          iconSize: 30,
                          color: colorIcon,
                          onPressed: () {
                            if(state.isEnabled){
                              modoEcoBloc.add(Disable());
                            }else{
                              modoEcoBloc.add(Enable());
                            }
                          },
                        ),
                      )
                  ),
                  Positioned.fill(
                      bottom: 15, left: 15,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Presiona para encender",
                          style: MyTextStyle.estilo(12, Colors.white),),
                      )
                  ),
                  Positioned.fill(
                      right: 20, bottom: 75,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.access_time),
                          iconSize: 30,
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      )
                  ),
                  Positioned.fill(
                      top: 75,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(description,
                          textAlign: TextAlign.center,
                          style: MyTextStyle.estilo(15, Colors.white),),
                      )
                  ),
                ],

              ),
            );
          });
  }
}