
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_antiheladas_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoAntiHeladasBasico extends StatelessWidget {
  String title = "MODO ANTI HELADAS BASICO";
  String description = "Cuando la temperatura baja de 2ºC el sistema abrirá la válvula vaciado para eliminar la presión de las tuberías y evitar daños. ";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_antiheladas_basico();
  }


  Widget modo_antiheladas_basico() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoAntiHeladasBasicoBloc,ModoAntiHeladasBasicoState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoAntiHeladasBasicoBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
            }else{
              colorIcon = Colors.white;
              colorIndic = Colors.grey;
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
                          title, style: MyTextStyle.estilo(17, Colors.white),),
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
                        child: iconSvgD("assets/icons/modo_antiheladas.svg", colorIndic, 55),
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
                          style: MyTextStyle.estilo(12, Colors.white),),
                      )
                  ),
                  MyPositioned.fill(
                      right: 20, bottom: 75,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.access_time),
                          iconSize: SC.all(30),
                          color: Colors.grey,
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
                          style: MyTextStyle.estilo(15, Colors.white),),
                      )
                  ),
                ],

              ),
            );
          });
  }
}