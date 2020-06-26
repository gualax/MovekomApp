import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Totalizador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    return totalizador_principal(context);
  }


  Widget totalizador_principal(context){
    return
      GestureDetector(
        onTap: (){
          TabChanger tabChanger =  TabChanger(context);
          tabChanger.changeTab(2);
        },
        child: MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 212, height: 282,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ), child: Stack(
            children: [
              // Valvulas (Todas)
              MyPositioned.fill(
                top: 5,
                child:  Align(
                  alignment: Alignment.topCenter,
                  child: Text("AMP. TOTALIZADOR",
                      style:MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, MyColors.text),
                      ),
                ),
              ),
              // OFF
              // 2.65 A
              MyPositioned.fill(
                left: 10, right: 10, bottom: 40,
                child:  Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/totalizador_img.png"),
                          fit: BoxFit.contain,
                        ),
                      )
                  ),
                ),
              ),
              MyPositioned.fill(
                left: 30, right: 10, top:10,
                child:  Align(
                  alignment: Alignment.center,
                  child: MyContainer(
                      height: 70,
                      width: 70,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/aguja_tot_img.png"),
                          fit: BoxFit.contain,
                        ),
                      )
                  ),
                ),
              ),
              MyPositioned.fill(
                top: 120,
                left: 10,
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Cargando",
                    style: MyTextStyle.estilo(18, MyColors.text) ,),
                ),
              ),
              MyPositioned.fill(
                top: 35,
                left: 10,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:Text("29.9",
                        style: MyTextStyle.estilo(60, MyColors.text) ,),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:Text("A",
                        style: MyTextStyle.estilo(30, MyColors.text) ,),
                    ),
                  ],
                ),
              ),
            ])
        ),
      );
  }


}
