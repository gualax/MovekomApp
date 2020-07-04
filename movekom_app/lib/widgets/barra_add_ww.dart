import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class AddWWBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return big();
  }

  Widget big(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 225,
      height: 20,
      color: MyColors.baseColor,
      child: Center(
        child: Text("AÑADIR",
          style: MyTextStyle.estiloBold(13, MyColors.text),),
      ),
    );
  }

}
