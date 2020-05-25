
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_emergencia_bloc.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoEmergencia extends StatelessWidget {
  String title = "MODO EMERGENCIA";
  String description = "En caso de una emergencia eléctrica, permite que los servicios básicos usen la batería de motor para alimentarse. (Algunos servicios no funcionaran y puede ocasionar problemas de arranque en el vehículo)";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_emergencia();
  }


  Widget modo_emergencia() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoEmergenciaBloc,ModoEmergenciaState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoEmergenciaBloc>(context);
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
                  color: MyColors.baseColor
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
                        child: modo_emergencia_image(state.isEnabled),
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
                          style: MyTextStyle.estilo(12, Colors.white),),
                      )
                  ),
                ],

              ),
            );
          });
  }

  Widget modo_emergencia_image(bool mode ){
    String imageRoute;
    if(mode){
      imageRoute = "assets/images/modos/modo_emergencia_on.png";
    }else{
      imageRoute = "assets/images/modos/modo_emergencia_off.png";
    }
    return Container(
      height: 70,
      width: 70,
      child: Image.asset(imageRoute) ,
    );
  }

}