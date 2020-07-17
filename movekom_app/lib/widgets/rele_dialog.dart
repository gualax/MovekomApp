import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';

import 'MyTextStyle.dart';

class BrokenReleDialog extends StatefulWidget {

  @override
  _BrokenReleDialogState createState() => _BrokenReleDialogState();
}

class _BrokenReleDialogState extends State<BrokenReleDialog> {
  bool reseted = false;

  Timer _timer;
  int _start = 1;


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            Navigator.of(context).pop(reseted);
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBrokenReleDialog();
  }


  Widget _buildBrokenReleDialog() {
    return new AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        height: SC.hei(500),
        width: MediaQuery.of(context).size.width,
        child: !reseted?  Stack(
          children: <Widget>[
            MyPositioned.fill(
                right: 200, top: 100,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text("AVERIA EN FUSIBLE",style: MyTextStyle.estiloBold(50, MyColors.white),),
                )
            ),
            MyPositioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("¿REARMAR?",style: MyTextStyle.estiloBold(40, MyColors.white),),
                )
            ),
            MyPositioned.fill(
                bottom: 100, right: 200,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    splashColor: MyColors.principal,
                    onTap: (){
                      setState(() {
                        reseted = true;
                        print("RESETED" + reseted.toString());
                        startTimer();
                      });
                    },
                    child: MyContainer(
                        child: Text("SI",style: MyTextStyle.estiloBold(40, MyColors.white),)),
                  ),
                )
            ),
            MyPositioned.fill(
                bottom: 100, left: 200,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    splashColor: MyColors.principal,
                    onTap: (){
                      print("NO");
                      Navigator.of(context).pop(reseted);
                    },
                    child: MyContainer(
                        child: Text("NO",style: MyTextStyle.estiloBold(40, MyColors.white),)),
                  ),
                )
            ),
            MyPositioned.fill(
                left: 100,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: rele_roto_img(150.0),
                )
            ),
          ],
        )
            :
        Stack(
          children: <Widget>[
            MyPositioned.fill(
                right: 200, top: 100,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text("FUSIBLE REARMADO",style: MyTextStyle.estiloBold(50, MyColors.white),),
                )
            ),
            MyPositioned.fill(
                left: 150,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: rele_img(150.0),
                )
            ),
          ],
        ),
      ),
    );
  }


  Widget rele_roto_img(dim){
    return MyContainer(
      width: dim,
      height: dim,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/reles/rele_roto.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

Widget rele_img(dim){
  return MyContainer(
    width: dim,
    height: dim,
    decoration: new BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/reles/rele10.png"),
        fit: BoxFit.contain,
      ),
    ),
  );
}
