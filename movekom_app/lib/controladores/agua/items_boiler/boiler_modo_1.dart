

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/blocs/item_boiler_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class BoilerModo1 extends StatefulWidget {
  int index;
  BoilerModo1(this.index);
  @override
  _BoilerModo1State createState() => _BoilerModo1State();
}


class _BoilerModo1State extends State<BoilerModo1> {
  bool isActive = false;
  int _index;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = widget.index;
  }
  @override
  Widget build(BuildContext context) {
    final boilerBloc = BlocProvider.of<BoilerBloc>(context);

    return iconBuble(widget.index, "assets/icons/icon_boiler_6.svg",boilerBloc);
  }


  Widget iconBuble(int dpas, iconRoute,boilerBloc) {
    Color color;
    if(isActive){
      color =  Colors.lightGreenAccent;
    }else{
      color = Colors.grey;
    }
    return GestureDetector(
      onTap: () {
        print("taping");
        setState(() {
          boilerBloc.add(Update(_index.toDouble()));
          if(isActive){
            isActive = false;
          }else{
            isActive = true;
          }
        });
      }, child: Container(
      width: 83,
      height: 83,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: iconSvgD(iconRoute, color, 40)
            ),
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(dpas.toString(),
                  style: MyTextStyle.estiloBold(10, Colors.white),),
              )
          )
        ],
      ),
    ),
    );
  }

}
