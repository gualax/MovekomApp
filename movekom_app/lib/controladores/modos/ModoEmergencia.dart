
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_emergencia_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
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
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
            }else{
              colorIcon = MyColors.text;
              colorIndic = MyColors.inactive;
            }

            return MyContainer(
              margin: EdgeInsets.only(top: SC.top(10), left: SC.left(15), right: SC.right(15)),
              width: 210,
              height: 250,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                      left: 10, top: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title, style: MyTextStyle.estilo(17, MyColors.text),),
                      )
                  ),
                  MyPositioned.fill(
                      top: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(17.0, colorIndic),
                      )
                  ),
                  MyPositioned.fill(
                      bottom: 75, left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: modo_emergencia_image(state.isEnabled),
                      )
                  ),
                  MyPositioned.fill(
                      left: 10,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(Icons.power_settings_new),
                          iconSize: SC.all(30),
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
                  MyPositioned.fill(
                      bottom: 15, left: 15,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Presiona para encender",
                          style: MyTextStyle.estilo(12, MyColors.text),),
                      )
                  ),
                  MyPositioned.fill(
                      right: 20, bottom: 75,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.access_time),
                          iconSize: SC.all(30),
                          color: MyColors.inactive,
                          onPressed: () {},
                        ),
                      )
                  ),
                  MyPositioned.fill(
                      top: 75,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(description,
                          textAlign: TextAlign.center,
                          style: MyTextStyle.estilo(12, MyColors.text),),
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
    return MyContainer(
      height: 70,
      width: 70,
      child: Image.asset(imageRoute) ,
    );
  }

}