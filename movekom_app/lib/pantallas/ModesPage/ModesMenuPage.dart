
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';

class ModesMenuPage extends StatefulWidget {
  @override
  _ModesMenuPageState createState() => _ModesMenuPageState();
}

class _ModesMenuPageState extends State<ModesMenuPage> {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: horizontalList(),
      ),
    );
  }



  Widget horizontalList(){
    return Container(
      alignment: Alignment.center,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        column1(),
        column1(),
        column1(),
        column1(),
        column1(),
        column1(),
      ],
    ),
    );
  }



Widget column1(){
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          box(),
          box(),
        ],
      ),
    );
  }

  Widget row2(){
    return  Container(
      child: Row(
        children: <Widget>[
          box(),
          box(),
          box(),
          box(),
          box(),
          box(),

        ],
      ),
    );
  }
  Widget box(){
    return Container(
      margin: EdgeInsets.only(top:20,left: 15,right: 15),
      width: SizeConfig.h * 17,
      height: SizeConfig.v * 32,
      decoration: new BoxDecoration(
          color: MyColors.ContainerColor
      ),
    );
  }

}