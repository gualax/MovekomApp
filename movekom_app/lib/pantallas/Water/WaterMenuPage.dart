


import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/box137x137.dart';

class WaterMenuPage extends StatefulWidget {
  @override
  _WaterMenuPageState createState() => _WaterMenuPageState();
}

class _WaterMenuPageState extends State<WaterMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.only(top: 80),
              child: Column(
                      children: <Widget> [
                        RowOfWaterTanks(),
                        tab(),
                        ],
              ),
          )
    );
  }

Widget RowOfWaterTanks(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WaterTank(),
        WaterTank(),
        WaterTank(),
        box137x137_Bomba_Agua(context, "2.65", true),
      ],
      ),
    );
}

}

Widget WaterTank(){
  return Container(
    margin: EdgeInsets.only(top:20,left: 40,right: 40,bottom: 20),
      width: 130,
      height: 174,
      decoration: new BoxDecoration(
          color: MyColors.ContainerColor,
      )
  );
}

Widget bottomTextMenu(){
  return Container(
    //  color: Colors.blueGrey,
    margin: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buttomText("ESTADO",true),
        buttomText("EQUIPOS",false),
      ],
    ),
  );
}

Widget textoGrafico(title){
  return RichText(
    text: TextSpan(
      text: title,
      style: TextStyle(
        fontFamily: 'Mada',
        color: Color(0xff9d9d9d),
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}




class buttomText extends StatefulWidget {
  final String title;
  final bool state;
  buttomText(this.title,this.state);
  @override
  _buttomTextState createState() => _buttomTextState();
}






class _buttomTextState extends State<buttomText> {
  Color color;
  bool _state;

  @override
  void initState(){
    super.initState();
    _state = widget.state;
    // you can use this.widget.foo here
  }

  @override
  Widget build(BuildContext context) {
    if(_state){
      color = Colors.lightGreenAccent;
    }else{
      color = Colors.white;
    }
     return FlatButton(
      onPressed: () {
        setState(() {
          if(_state) {
              _state = false;
          }else{
             _state = true;
          }
        });
      },
      child: Text(
        widget.title ,style: MyTextStyle.estiloBold(20,color),
      ),
    );
  }
}



Widget tab(){
  return DefaultTabController(
  length: 2,
  child: Container(
    width: 400,
    //color: Colors.blueGrey,
    child: TabBar(
        onTap:(index){
          changePage(index);
        },
        indicatorColor: Colors.lightGreenAccent,
        unselectedLabelColor: Colors.white,
        labelColor: Colors.lightGreenAccent,
        tabs: [
          Tab(text: "ESTADO"),
          Tab(text: "EQUIPOS"),
          ],
    ),
  ),
  );
}


changePage(int index){
  print("change page" + index.toString());
}
