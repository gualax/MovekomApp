

import 'package:flutter/material.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/widgets/IconSvg.dart';

class LightsMenuPage extends StatefulWidget {
  @override
  _LightsMenuPageState createState() => _LightsMenuPageState();
}

class _LightsMenuPageState extends State<LightsMenuPage> {
  BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
            child: Column(
              children: <Widget>[
       //         title(),
                row1(),
                row1(),
                boxSave(),
                boxSave(),
              ],
            ),
      ),
    );
  }




  Widget title(){
    return
      Container(
        //   color: Colors.blueGrey,
        margin: EdgeInsets.only(left: 30),
        alignment: Alignment.topLeft,
        height: 60,
        child: RichText(
            text: new TextSpan(
                children: [
                  new TextSpan(
                      text: "MENU DE ILUMINACION ",
                      style: TextStyle(
                        fontFamily: 'Mada',
                        color: Color(0xffffffff),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  new TextSpan(
                      text: "",
                      style: TextStyle(
                        fontFamily: 'Mada',
                        color: Color(0xff9d9d9d),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                ]
            )
        ),
      );
  }


  Widget row1(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          box208x140(AppLocalizations.of(mContext).translate('luz_general'),
          "assets/images/sofa.svg"),
          box208x140(AppLocalizations.of(mContext).translate("luz_general"),
              "assets/images/sofa.svg"),
          box208x140(AppLocalizations.of(mContext).translate("luz_general"),
              "assets/images/sofa.svg"),
          box208x140(AppLocalizations.of(mContext).translate("luz_general"),
              "assets/images/sofa.svg"),
        ],
      ),
    );
  }

Widget box208x140(title,iconRoute) {
  return Container(
      margin: EdgeInsets.all(5),
      width: 208,
      height: 140,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ), child: Stack(
         children: [
           Positioned.fill(
             top: 7,
             child: Align(
               alignment: Alignment.topRight,
               child: _switch(),
             ),
           ),
           Positioned.fill(
             left: 10,
             child: Align(
               alignment: Alignment.center,
               child: iconSvgD(iconRoute, Colors.white,60),
             ),
           ),
           PositionedDirectional(
             top: 4,
             start: 10,
             child:   RichText(
                 text: TextSpan(
                     children: [
                       TextSpan(
                           style:estiloBold(),
                           text: title ),
                     ]
                 )
             ),
           ),
       ],
      ),
  );
}

  Widget  boxSave(){
    return  Container(
    //  color: Colors.green,
      width: 870,
      child: Row(
      //  mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          box208x109(),
          box108x109(),
        ],
      ),

    );
  }

Widget  box208x109(){
  return Container(
    margin: EdgeInsets.all(5),
      width: 208,
      height: 109,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      )
  );
}

Widget box108x109(){
  return Container(
      width: 108,
      height: 109,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      )
  );
}
  Widget _switch(){
    return Switch(
        value:false,
        activeColor: Colors.white,
        onChanged: (bool state){
          print(state);
        }
    );
  }
  TextStyle estiloBold() {
    return TextStyle(
        color: const Color(0xffffffff),
        fontWeight: FontWeight.bold,
        fontFamily: "Mada",
        fontStyle: FontStyle.normal,
        fontSize: 15.0
    );

  }

}
