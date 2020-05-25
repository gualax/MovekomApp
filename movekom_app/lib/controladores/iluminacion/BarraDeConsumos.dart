
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';



class BarraDeConsumos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return barra_consumos();
  }

  Widget barra_consumos() {
    return Container(
      margin: EdgeInsets.all(SizeConfig.x(1)),
      width: SizeConfig.h * 71,
      height: SizeConfig.v * 20,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              top: SizeConfig.y(2.5), left: SizeConfig.x(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Horas totales de Luz",
                  style: MyTextStyle.estiloBold(SizeConfig.y(2.8), Colors.white),),
              )
          ),
          Positioned.fill(
              top:SizeConfig.y(2.5), left: SizeConfig.x(9),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Consumo actual",
                  style: MyTextStyle.estiloBold(SizeConfig.y(2.8), Colors.white),),
              )
          ),
          Positioned.fill(
              top: SizeConfig.y(2.5), right: SizeConfig.x(5),
              child: Align(
                alignment: Alignment.topRight,
                child: Text("Consumo total",
                  style: MyTextStyle.estiloBold(SizeConfig.y(2.8), Colors.white),),
              )
          ),
          Positioned.fill(
              top: SizeConfig.y(7), right: SizeConfig.x(3),
              child: Align(
                alignment: Alignment.topRight,
                child: Text("120 ah",
                  style: MyTextStyle.estiloBold(SizeConfig.y(7), Colors.white),),
              )
          ),
          Positioned.fill(
              top: SizeConfig.y(7), left: SizeConfig.x(11),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("145hs",
                  style: MyTextStyle.estiloBold(SizeConfig.y(7), Colors.white),),
              )
          ),
          Positioned.fill(
              top:SizeConfig.y(7), left: SizeConfig.x(6),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("12ha",
                  style: MyTextStyle.estiloBold(SizeConfig.y(7), Colors.white),),
              )
          ),
          Positioned.fill(
            left: SizeConfig.x(0.7),
            child: Align(
              alignment: Alignment.centerLeft,
              child:IconButton(
                icon: Icon(Icons.access_time), iconSize: SizeConfig.y(14),
                color: Colors.white, onPressed: () {},),
            ),
          ),
        ],
      ),
    );
  }

}