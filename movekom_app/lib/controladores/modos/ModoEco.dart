
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_eco_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoEco extends StatelessWidget {
  String title = "MODO ECO";
  String description = "Utiliza solo energía proveniente de energías renovables como la solar o la eólica.";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_eco();
  }


  Widget modo_eco() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoEcoBloc,ModoEcoState>(
        builder: ( context, state) {
       final modoEcoBloc = BlocProvider.of<ModoEcoBloc>(context);
       if(state.isEnabled){
         colorIcon = Colors.lightGreenAccent;
         colorIndic = Colors.lightGreenAccent;
       }else{
         colorIcon = MyColors.text;
         colorIndic = MyColors.inactive;
       }

      return MyContainer(
        margin: EdgeInsets.only(top: SC.top(10), left: SC.left(15), right: SC.right(15)),
      width: 210,
      height: 250,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              left: 10, top: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title, style: MyTextStyle.estilo(17, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              top: 10, right: 10,
              child: Align(
                alignment: Alignment.topRight,
                child: circuloConSombra(17.0, colorIndic),
              )
          ),
          MyPositioned.fill(
              bottom: 75, left: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: modo_eco_image(state.isEnabled,SC.all(70)),
              )
          ),
          MyPositioned.fill(
              left: 10,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(Icons.power_settings_new),
                  iconSize: SC.all(30),
                  color: colorIcon,
                  onPressed: () {
                    if(state.isEnabled){
                      modoEcoBloc.add(Disable());
                    }else{
                      modoEcoBloc.add(Enable());
                    }
                  },
                ),
              )
          ),
          MyPositioned.fill(
              bottom: 15, left: 15,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Presiona para encender",
                  style: MyTextStyle.estilo(12, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              right: 20, bottom: 75,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.access_time),
                  iconSize: SC.all(30),
                  color: MyColors.inactive,
                  onPressed: () {},
                ),
              )
          ),
          MyPositioned.fill(
              top: 75,
              child: Align(
                alignment: Alignment.center,
                child: Text(description,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
        ],

      ),
    );
    });
  }

  Widget modo_eco_image(bool mode,dim ){
    String imageRoute;
    if(mode){
      imageRoute = "assets/images/modos/modo_eco_on.png";
    }else{
      imageRoute = "assets/images/modos/modo_eco_off.png";
    }
    return Container(
      height: dim,
        width: dim,
        child: Image.asset(imageRoute) ,
    );
  }

}