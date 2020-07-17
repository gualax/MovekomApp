import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_parque_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class LuzPerimetro extends StatefulWidget {
  @override
  _LuzPerimetroState createState() => _LuzPerimetroState();
}

class _LuzPerimetroState extends State<LuzPerimetro> {
  String title = "LUCES EXTERIOR";
  LucesExteriorBloc lucesExtBloc;
  @override
  Widget build(BuildContext context) {
    return luz_perimtro_widget();
  }



  Widget luz_perimtro_widget() {
    Color colorIcon;
    return
      BlocBuilder<LucesExteriorBloc, LucesExteriorState>(
          builder: (context, state) {
            lucesExtBloc = BlocProvider.of<LucesExteriorBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
            } else {
              colorIcon = MyColors.inactive;
            }
            return InkWell(
              splashColor: MyColors.principal,
              onTap: (){
                if(state.isEnabled){
                  lucesExtBloc.add(Disable());
                } else {
                  lucesExtBloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(5)),
                height: 116,
                width: 422,
                color: MyColors.baseColor,
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                      top: 5, left: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(title,
                          style: MyTextStyle.estilo(16, MyColors.text),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(15, colorIcon),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: iconSvgD(
                            "assets/icons/spotlight.svg", colorIcon, 60),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }


}
