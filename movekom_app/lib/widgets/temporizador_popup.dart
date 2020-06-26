import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TemporizadorPopup extends StatefulWidget {
  @override
  _TemporizadorPopupState createState() => _TemporizadorPopupState();
}

class _TemporizadorPopupState extends State<TemporizadorPopup> {
  @override
  Widget build(BuildContext context) {
    return _buildAboutDialog(context);
  }



  void datePicker(){
         DatePicker.showDatePicker(context,
             theme: DatePickerTheme(
               headerColor: Colors.lightGreen,
               backgroundColor: MyColors.baseColor,
               itemStyle: MyTextStyle.estiloBold(20, MyColors.text),
               cancelStyle: MyTextStyle.estiloBold(20,Colors.black),
               doneStyle: MyTextStyle.estiloBold(20,MyColors.text),
             ),
             showTitleActions: true,
             minTime: DateTime(2018, 3, 5),
             maxTime: DateTime(2019, 6, 7),
             onChanged: (date) {
               print('change $date');
             }, onConfirm: (date) {
               print('confirm $date');
             }, currentTime: DateTime.now(), locale: LocaleType.es);
       }


  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Colors.black,
        title:  Text('Temporizador',
          style:MyTextStyle.estiloBold(15, Colors.white)),
        content:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _fechasRow(),
              _horasRow(),
              _buttonSave(),
            ],
          ),
        ),
    );
  }

  Widget _buttonSave(){
    return MyContainer(
        height: 70,
        width: 120,
        child: MaterialButton(
         color: MyColors.baseColor ,
         onPressed: (){
           Navigator.of(context).pop();
           print("button Pressed");
         },
          child: Text("SAVE",
          style: MyTextStyle.estiloBold(12, Colors.white),),
        ),
    );
  }


  Widget _horaInicio(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
      height: 140,
      width: 200,
      decoration: new BoxDecoration(
          color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:5, left: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Hora inicio",
                style: MyTextStyle.estiloBold(20, Colors.white),),
              )
          ),
          MyPositioned.fill(
            right: 40, top: 10,
              child: Align(
                alignment: Alignment.center,
                child: MyContainer(
                  height: 60, width: 60,
                  child: TextField(
                    readOnly: true,
                    onTap: (){
                      showTimeNative();
                    },
                    maxLength: 2,
                    style: MyTextStyle.estiloBold(30, Colors.white),
                    decoration: InputDecoration(
                        //sborder: InputBorder,
                      counterText: '',
                      counterStyle: TextStyle(fontSize: 0),
                        hintText: '11',
                        hintStyle: MyTextStyle.estiloBold(30, Colors.white),
                  ),
                  ),
                ),
              ),
              ),
          MyPositioned.fill(
            left: 10,
            child: Align(
              alignment: Alignment.center,
              child: MyContainer(
                height: 30, width: 30,
                child: Text(":",style: MyTextStyle.estiloBold(30, Colors.white),)
              ),
            ),
          ),
          MyPositioned.fill(
            left: 25, top:10,
            child: Align(
              alignment: Alignment.center,
              child: MyContainer(
                height: 60, width: 60,
                child: TextField(
                  maxLength: 2,
                  style: MyTextStyle.estiloBold(30, Colors.white),
                  decoration: InputDecoration(
                    //sborder: InputBorder,
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                    hintText: '   11',
                    hintStyle: MyTextStyle.estiloBold(30, Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fechaInicio(){
 //usar calendario
  }

  Widget _horaFin(){

  }

  Widget _fechaFin(){
    return MyContainer(
    margin: EdgeInsets.all(SC.all(10)),
    height: 140,
    width: 200,
    decoration: new BoxDecoration(
    color: MyColors.baseColor,
    ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 5, left: 5,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Fecha fin",
                  style: MyTextStyle.estiloBold(20, Colors.white),
                ),
            ),
          ),
          MyPositioned.fill(
            top: 12, left: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: MyContainer(
                height: 55, width: 140,
                child:TextField(
                  style: MyTextStyle.estiloBold(13, Colors.white),
                  onTap: (){
                    datePicker();
                  },
                  readOnly: true,
                  focusNode: FocusNode(),
                  enableInteractiveSelection: false,
                  textAlign: TextAlign.center,
                  maxLength: 14,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: new InputDecoration(
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                    hintText: '11/12/1992',
                    hintStyle: MyTextStyle.estiloBold(17, Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                ) ,
              ),
            ),
          ),
          MyPositioned.fill(
            top: 7, right: 10,
            child: Align(
              alignment: Alignment.centerRight,
              child: iconSvgD("assets/icons/calendar.svg", MyColors.principal, 40),
              ),
            ),
        ],
      ),
    );
  }

  Widget _save(){

  }

 Widget _fechasRow(){
   return Container(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         _fechaFin(),
         _fechaFin()
       ],
     ),
   );
 }

  Widget _horasRow(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _horaInicio(),
          _horaInicio(),
        ],
      ),
    );
  }


  void showDateNative(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001),
        lastDate: DateTime(2222),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.lightGreen,
            accentColor: Colors.green,
            dialogBackgroundColor: MyColors.baseColor,
            textTheme: TextTheme(
              body1: MyTextStyle.estiloBold(12, Colors.white),
              caption: TextStyle(color: Colors.white),
            ),
            disabledColor: Colors.grey,
            accentTextTheme: TextTheme(
              body2 : TextStyle(color: Colors.white),
            ),
          ),
          child: child,
        );
      },
    ).then((date){
        print("sected date:"+ date.toString());
    });
  }


  void showTimeNative(){
        showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData(
                primaryColor: Colors.lightGreen,
                accentColor: Colors.green,
                dialogBackgroundColor: MyColors.baseColor,
                textTheme: TextTheme(
                  body1: MyTextStyle.estiloBold(12, Colors.white),
                  caption: TextStyle(color: Colors.white),
                ),
                disabledColor: Colors.grey,
                accentTextTheme: TextTheme(
                  body2 : TextStyle(color: Colors.white),
                ),
              ),
              child: child,
            );
          },
        ).then((time){
          print("sected time:"+ time.toString());
        });
  }


}





