import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/rele_dialog.dart';

class ReleWidget extends StatefulWidget {

   final bool isActive;
   final String title;
  ReleWidget(this.title,this.isActive);

  @override
  _ReleWidgetState createState() => _ReleWidgetState();
}


class _ReleWidgetState extends State<ReleWidget> {
  bool _isActive;

  @override
  void initState() {
    _isActive = widget.isActive;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return rele();
  }


  Widget rele(){
    return InkWell(
      splashColor: MyColors.principal,
      onTap: (){
        if(!_isActive) {
          showDialog(
              context: context,
              builder: (context) {
                return BrokenReleDialog(
                );
              }).then((val) {
            setState(() {
              print("val setstate");
              print(val);
              _isActive = val;
            });
          });
        }
      },
      child: MyContainer(
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
                  child: Text(widget.title,
                    style: MyTextStyle.estiloBold(14, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                child: Align(
                  child:_isActive ? rele_img() :rele_roto_img() ,
                )
            ),
          ],
        ),
      ),
    );
  }


  Widget rele_roto_img(){
    return MyContainer(
      width: 80,
      height: 80,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/reles/rele_roto.png"),
          fit: BoxFit.contain,
        ),
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
