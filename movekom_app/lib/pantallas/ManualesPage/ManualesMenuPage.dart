
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/widgets/IconSvg.dart';


class ManualesMenuPage extends StatefulWidget {
  @override
  _ManualesMenuPageState createState() => _ManualesMenuPageState();
}

class _ManualesMenuPageState extends State<ManualesMenuPage> {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(50),
        alignment: Alignment.center,
           child: box(),
      ),
    );
  }

  Widget box(){
       return Container(
         padding: EdgeInsets.all(15),
          decoration: new BoxDecoration(
              color: MyColors.ContainerColor,
          ),
         child: GridView.count(
             crossAxisCount: 7,
             children: List.generate(15, (index) {
           return iconSvgD("assets/icons/pdf_view.svg", Colors.white, 15);
         }),
         ),
     );
  }


  
}