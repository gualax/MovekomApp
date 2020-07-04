import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Totalizador extends StatelessWidget {
  int widgetType;
  Totalizador(this.widgetType);
  String title = "AMP. TOTALIZADOR";
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    if(widgetType == 1){
      return totalizador_principal(context);
    }else {
      return totalizador_electricidad();
    }
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
                  child: Text(title,
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
                  child:totalizadorImg(-40) ,
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




  Widget totalizador_electricidad(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 410,
      height: 198,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:5,
            left: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                  title, style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            right: 20,
            child: Align(
              alignment: Alignment.centerRight,
              child: MyContainer(
                height: 180,
                width: 180,
                  child: totalizadorImg(50)),
            ),
          ),
          MyPositioned.fill(
            left: 20,
            bottom: 70,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Cargando", style: MyTextStyle.estilo(17, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            left: 30, top: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "29.9", style: MyTextStyle.estiloBold(70, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            left: 90, bottom: 20,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                  "A", style: MyTextStyle.estiloBold(35, MyColors.text)),
            ),
          ),
        ],
      ),
    );
  }


  Widget totalizadorImg(int valueAh){
    int index;
    String numberStr;
    switch(valueAh){
      case 0:
        index = 0;
        break;
      default:
        index = valueAh ;
        break;
    }
    numberStr = index.truncate().toString();
    print(numberStr);
    return Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/totalizador/totalizador_$numberStr.png"),
            fit: BoxFit.contain,
          ),
        )
    );
  }

}
