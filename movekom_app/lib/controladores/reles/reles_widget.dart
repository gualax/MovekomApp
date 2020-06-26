import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ReleWidget extends StatefulWidget {
  @override
  _ReleWidgetState createState() => _ReleWidgetState();
}

class _ReleWidgetState extends State<ReleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }


  Widget rele(title,status){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
      width: 120,
      height: 120,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              top: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                  style: MyTextStyle.estiloBold(14, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              child: Align(
                child: rele_img(),
              )
          ),
        ],
      ),
    );
  }

  Widget rele_img(){
    return MyContainer(
      width: 80,
      height: 80,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/reles/rele10.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }


}
/// ver de generar una lista


class Rele {

String name;
bool status;

}
