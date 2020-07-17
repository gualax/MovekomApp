import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/temp_programas/blocs/general_timer_dialog_bloc.dart';
import 'package:movekomapp/widgets/temp_programas/controllers/temp_programa_widget.dart';


import '../IconSvg.dart';
import 'controllers/temp_program_widget2.dart';
import 'controllers/temp_program_widget3.dart';
import 'controllers/temp_program_widget4.dart';
import 'controllers/temp_program_widget5.dart';
import 'controllers/temp_program_widget6.dart';

class TimerDialog extends StatefulWidget {
  @override
  _TimerDialogState createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
 bool estadoInicial = false;
 static String description = "PULSA SOBRE EL PROGRAMADESEADO PARA CONFIGURAR SUFUNCIONAMIENTO";
  @override
  void initState() {
    estadoInicial = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return timer_dialog();
  }

  Widget timer_dialog(){
    return
      BlocBuilder<GeneralTimerProgramBloc,GeneralTimerProgramState>(
    builder: ( context, state) {
    return new AlertDialog(
        backgroundColor: Colors.black,
        content:  Container(
        margin: EdgeInsets.only(left: SC.left(60),right: SC.right(60)) ,
        color: Colors.black,
        height: SC.hei(500),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            MyContainer(
                child: MyPositioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child:  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: MyContainer(
                        height: 45,
                        width: 45,
                        child: iconSvgD("assets/icons/close_cross.svg", MyColors.text, 20),
                      ),
                    ),
                  ),
                )
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: MyContainer(
                        child: Wrap(
                          spacing: SC.all(20),
                          children: <Widget>[
                            TimerProgramWidget(1),
                            TimerProgramWidget2(1),
                            TimerProgramWidget3(1),
                            TimerProgramWidget4(1),
                            TimerProgramWidget5(1),
                            TimerProgramWidget6(1),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                    flex: 3,
                    child: MyContainer(
                        color: Colors.pink,
                        child: timerPwidgets[state.numberWidget]
                    ),
                  )
                ],
              ),
            ),
          ],
        )
       )
    );});
  }


  static Widget emptyDialogProgram(){
    return MyContainer(
            height: 394.00,
            width: 482.00,
            color: MyColors.baseColor,
            child: Center(
              child: Text(description,
              style: MyTextStyle.estilo(20, MyColors.text), textAlign: TextAlign.center,),
            )
    );
  }

  final List<Widget> timerPwidgets =  [
    emptyDialogProgram(),
    TimerProgramWidget(2),
    TimerProgramWidget2(2),
    TimerProgramWidget3(2),
    TimerProgramWidget4(2),
    TimerProgramWidget5(2),
    TimerProgramWidget6(2),
  ];
}



