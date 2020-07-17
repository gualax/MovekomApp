
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/radial_postion.dart';
import 'package:movekomapp/blocs/climatizacion/extractor_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';
import 'dart:math';


class ExtractorNew extends StatefulWidget {
  @override
  _ExtractorNewState createState() => _ExtractorNewState();
}

class _ExtractorNewState extends State<ExtractorNew> {
  String title = "EXTRACTOR";
  ExtractorBloc bloc;
  double angleDelta;
  static double MIN = 145;
  static double MAX = 230;
  static double MIDLE = 180;

  @override
  void initState() {
    angleDelta = 180; //-90 //start from top position
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return extractor();
  }

  Widget extractor() {
    Color colorIcon, colorImg, colorText;
    String on_off;
    return
      BlocBuilder<ExtractorBloc, ExtractorState>(
          builder: (context, state) {
            bloc = BlocProvider.of<ExtractorBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorImg = MyColors.principal;
              colorText = MyColors.text;
              on_off = "Pulse para apagar";
            } else{
              colorIcon = MyColors.text;
              colorImg = MyColors.inactive;
              colorText = MyColors.inactive;
              on_off = "Pulse para encender";
            }
            return
              MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 450,
                  height: 220,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                    children: <Widget>[
                      MyPositioned.fill(
                          left: 35,
                          top: 10,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(title,
                              style: MyTextStyle.estiloBold(20, colorText),),
                          )
                      ),
                      MyPositioned.fill(
                          left: 20,
                          top: 10,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: iconSvgD("assets/icons/fan.svg", colorImg, 80),
                          )
                      ),
                      MyPositioned.fill(
                          left: 10,
                          top: 15,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: circuloConSombra(15, colorImg),
                          )
                      ),
                      MyPositioned.fill(
                        left: 30,
                        child: Align(
                          alignment: Alignment.center,
                          child: MyContainer(
                            //   color: Colors.blue,
                            height: 70,
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text( state.isEnabled ? simulateTemp(angleDelta).toString() : "--",
                                    style: MyTextStyle.estiloBold(70, colorText),),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("ºC",
                                    style: MyTextStyle.estiloBold(40, colorText),),
                                )
                              ],
                            ),
                          ),
                        ),

                      ),
                      MyPositioned.fill(
                          left: 20,
                          bottom: 15,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(on_off,
                              style: MyTextStyle.estiloBold(17, colorText),),
                          )
                      ),
                      MyPositioned(
                        left: 350,
                        bottom: 1, top: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: extractor_indic_img(200.0),
                        ),
                      ),
                      MyPositioned(
                        bottom: 5, right: 10,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child:Text("15ºC",
                            style: MyTextStyle.estiloBold(16, MyColors.text),),
                        ),
                      ),
                      MyPositioned(
                        top: 5, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child:Text("35ºC",
                            style: MyTextStyle.estiloBold(16, MyColors.text),),
                        ),
                      ),
                      MyPositioned.fill(
                          right: 160, bottom: 17,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: iconSvgD("assets/icons/on_off.svg", colorIcon, 20),
                          )
                      ),
                      MyPositioned.fill(
                        left: 230,
                        child: Align(
                          alignment: Alignment.center,
                          child: state.isEnabled ? GestureDetector(
                            onVerticalDragUpdate: _onVerticalDragUpdate,
                            onHorizontalDragUpdate: _onHorizontalDragUpdate,
                            child: MyContainer(
                              height: 220,
                              width: 100,
                              color: Colors.transparent,
                            ),
                          ) : null
                        ),
                      ),
                      Transform.translate(
                        offset:  Offset(SC.x(40), 5.0),
                        child: RadialPosition(
                          radius: SC.all(100), //150
                          angle: angleToRad(angleDelta),
                          child: state.isEnabled ?  GestureDetector(
                            //  onPanUpdate: _onPanUpdate,
                            onVerticalDragUpdate: _onVerticalDragUpdate,
                            onHorizontalDragUpdate: _onHorizontalDragUpdate,
                            child: MyContainer(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: flechaIndicador(angleToRad(angleDelta), 40.0)),
                            ),
                          ) :
                          MyContainer(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: flechaIndicador(angleToRad(angleDelta), 40.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyContainer(
                          width: 300,
                          height: 174,
                          child: GestureDetector(
                            onTap: (){
                              if(state.isEnabled){
                                bloc.add(DisableExtractor());
                              }else{
                                bloc.add(EnableExtractor());
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
              );
          }
      );
  }



  void _onVerticalDragUpdate(DragUpdateDetails details) {
    //  print("*** Vertical dx : " + details.delta.dx.toString());
    print("*** Vertical dy : " + details.delta.dy.toString());
    if (angleDelta >= MIN && angleDelta <= MAX) {
      angleDelta = angleDelta - ((details.delta.dy).roundToDouble() / 2);
    } else if (angleDelta < MIN) {
      angleDelta = MIN + 1;
    } else if (angleDelta > MAX) {
      angleDelta = MAX - 1;
    }
    //calefaccionBloc.add(UpdateCalefaccionTemp(simulateTemp(angleDelta)));
    setState(() {});
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    print("*** Horizontal dx : " + details.delta.dx.toString());
    print("*** Horizontal dy : " + details.delta.dy.toString());
    if (angleDelta >= MIN && angleDelta <= MAX) {
      angleDelta = angleDelta + ((details.delta.dx).roundToDouble() / 2);
    } else if (angleDelta < MIN) {
      angleDelta = MIN + 1;
    } else if (angleDelta > MAX) {
      angleDelta = MAX - 1;
    }
   // calefaccionBloc.add(UpdateCalefaccionTemp(simulateTemp(angleDelta)));
    setState(() {});
  }

  double angleToRad(angle) {
    double converted = angle * pi / 180.0;
    print("converted: " + converted.toString());
    if (converted > ((pi / 2) + 0.5) && converted < ((pi * 1.5) - 0.5)) {
      return converted;
    } else if (converted <= ((pi / 2) + 0.5)) {
      return (pi / 2) + 0.5;
    } else {
      return ((pi * 1.5) - 0.5);
    }
  }


  int simulateTemp(double val) {
    if (val <170 && val >= 155) {
      return (val * 1.3 / 10).round(); //1.388/ abajo
    } else  if (val < 155) {
      return (val * 1.1 / 10).round(); //1.388/ abajo
    }

    if (val >= 190 && val <= 220 ) {
      return (val * 1.45 / 10).round(); //1.388/ arriba
    } else if (val > 220 ) {
      return (val * 1.52 / 10).round(); //1.388/ arriba
    }

      return (val * 1.4 / 10).round(); //original 1.388
  }



  Widget extractor_indic_img(dim){
    return MyContainer(
        height: dim,
        width: dim,
        //margin: EdgeInsets.all(dim),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/extractor10.png"),
            fit: BoxFit.contain,
          ),
        )
    );
  }


}
