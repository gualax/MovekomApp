import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Totalizador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    return totalizador_principal();
  }


  Widget totalizador_principal(){
    return
      MyContainer(
          margin: EdgeInsets.all(SC.all(7)),
          width: 137, height: 137,
          decoration: new BoxDecoration(
              color: MyColors.baseColor
          ), child: Stack(
          children: [
            // Valvulas (Todas)
            MyPositioned.fill(
              top: 4, left: 10,
              child:   RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style:MyTextStyle.estiloBold(15, MyColors.text),
                            text: "Totalizador" ),
                      ]
                  )
              ),
            ),
            // OFF
            // 2.65 A
            MyPositioned.fill(
              left: 10, right: 10,
              child:  Align(
                alignment: Alignment.center,
                child: Container(
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/amperimetro/amp_sa_2.png"),
                        fit: BoxFit.contain,
                      ),
                    )
                ),
              ),
            ),
            MyPositioned.fill(
              top: 35,
              left: 10,
              child:  Align(
                alignment: Alignment.center,
                child:Text("20"+"Ah",
                  style: MyTextStyle.estiloBold(30, MyColors.text) ,),
              ),
            ),
          ])
      );
  }


}
