import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWCargadorBaterias extends StatelessWidget {

  bool isAdded;
  String title = "CARGADOR";

  WWCargadorBaterias(this.isAdded);
  CargadorBateriaBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<CargadorBateriaBloc>(context);
    return cargador_bateria_ww();
  }

  Widget cargador_bateria_ww(){
    Color iconColor = MyColors.white;
    Color colorTex = MyColors.white;
    return
      BlocBuilder<CargadorBateriaBloc,CargadorBateriaState>(
          builder: ( context, state) {
            if(isAdded){
            if(state.isEnabled){
              iconColor =  MyColors.principal;
              colorTex = MyColors.text;
            }else{
              colorTex = MyColors.inactive;
              iconColor = MyColors.text;
            }
            }
            return GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  bloc.add(DisableCargador());
                }else{
                  bloc.add(EnableCargador());
                }
              },
              onLongPress: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(Constants.PAGE_ELECTRICITY);
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                width: 225,
                height: 140,
                decoration: new BoxDecoration(
                  color: MyColors.baseColor,
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        left: 10, top: 10,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(title,
                            style: MyTextStyle.estiloBold(18, colorTex),
                            textAlign:TextAlign.center ,),
                        )
                    ),
                    MyPositioned.fill(
                        left: 90, top: 35,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(state.valueAmp.toString(),
                            style: MyTextStyle.estiloBold(50, colorTex),),
                        )
                    ),
                    MyPositioned.fill(
                        left: 20, top: 35,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: iconSvgD("assets/icons/enchufe_cargador_acc.svg", iconColor, 40),
                        )
                    ),
                    MyPositioned.fill(/// consumo
                        bottom: 40, left: 90,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              "Carga A",
                              style: MyTextStyle.estilo(14, colorTex),
                              textAlign: TextAlign.center
                          ),
                        )
                    ),
                    MyPositioned.fill(
                        top: 10, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: circuloConSombra(18.0, iconColor),
                        )
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }
}

