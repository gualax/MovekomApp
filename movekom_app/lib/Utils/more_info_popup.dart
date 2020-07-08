import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class MoreInfoPopup extends StatefulWidget {
  String title;
  String description;

  MoreInfoPopup(this.title,this.description);

  @override
  _MoreInfoPopupState createState() => _MoreInfoPopupState();
}

class _MoreInfoPopupState extends State<MoreInfoPopup> {
  @override
  Widget build(BuildContext context) {
    return dialog();
  }


  Widget dialog(){
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(widget.title,
        style:MyTextStyle.estiloBold(20, MyColors.text),
        textAlign: TextAlign.center,),
      content: MyContainer(
        height: 250,
        width: 400,
        child: Stack (
          children: <Widget>[
            MyPositioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: MyContainer(
                    height: 2,
                    width:380,
                    color: MyColors.white,
                  ),
                )
            ),
            MyPositioned.fill(
              top: 15,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(widget.description,
                    style: MyTextStyle.estilo(25, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: iconSvgD("assets/icons/close_cross.svg", MyColors.text, 40)
                    ),
                  )
              ),
          ],
        ),
        //color: MyColors.baseColor,
      ) ,
    );
  }

}
