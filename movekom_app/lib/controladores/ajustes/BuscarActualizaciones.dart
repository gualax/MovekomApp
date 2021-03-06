import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class BuscarActualizaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buscar_actu_widget();
  }



  Widget buscar_actu_widget(){
    return MyContainer(
      height: 190.00,
      width: 190.00,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              top: 10,left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("BUSCAR ACTUALIZACIONES",
                  style: MyTextStyle.estilo(16, MyColors.text),
                  textAlign:TextAlign.center ,),
              )
          ),
          MyPositioned.fill(
              left: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child:iconSvgNc("assets/icons/lupa.svg", 45),
              )
          ),
          MyPositioned.fill(
              right: 10,top: 10,
              child: Align(
                alignment: Alignment.topRight,
                child:circuloConSombra(13, MyColors.inactive),
              )
          ),
          MyPositioned.fill(
              bottom: 20, left: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:Text("Pulsar para activar",
                  style: MyTextStyle.estilo(12, MyColors.inactive),),
              )
          ),
          MyPositioned.fill(
              right: 60,
              child: Align(
                alignment: Alignment.centerRight,
                child:Text("Estado",
                  style: MyTextStyle.estilo(17, MyColors.text),
                ),
              )
          ),
          MyPositioned.fill(
              right: 55,top:35,
              child: Align(
                alignment: Alignment.centerRight,
                child:Text("Actualizado",
                  style: MyTextStyle.estilo(12, MyColors.text),),
              )
          ),
          MyPositioned.fill(
            left:15,bottom:20,
            child: Align(
                alignment: Alignment.bottomLeft,
                child:iconSvgD("assets/icons/on_off.svg", MyColors.inactive, 20)
            ),
          ),
        ],
      ),
    );
  }

}
