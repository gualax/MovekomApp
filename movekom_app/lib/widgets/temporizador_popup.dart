import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
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
             showTitleActions: true,
             minTime: DateTime(2018, 3, 5),
             maxTime: DateTime(2019, 6, 7), onChanged: (date) {
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
    return Container(
        height: 50,
        width: 100,
        child: MaterialButton(
         color: MyColors.ContainerColor ,
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
    return Container(
      margin: EdgeInsets.all(10),
      height: 70,
      width: 150,
      decoration: new BoxDecoration(
          color: MyColors.ContainerColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            top:5, left: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Hora inicio",
                style: MyTextStyle.estiloBold(10, Colors.white),),
              )
          ),
          Positioned.fill(
            right: 40, top: 10,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30, width: 30,
                  child: TextField(
                    readOnly: true,
                    onTap: (){
                      showTimeNative();
                    },
                    maxLength: 2,
                    style: MyTextStyle.estiloBold(20, Colors.white),
                    decoration: InputDecoration(
                        //sborder: InputBorder,
                      counterText: '',
                      counterStyle: TextStyle(fontSize: 0),
                        hintText: '11',
                        hintStyle: MyTextStyle.estiloBold(20, Colors.white),
                  ),
                  ),
                ),
              ),
              ),
          Positioned.fill(
            left: 10,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 30, width: 30,
                child: Text(":",style: MyTextStyle.estiloBold(20, Colors.white),)
              ),
            ),
          ),
          Positioned.fill(
            left: 25, top:10,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 30, width: 30,
                child: TextField(
                  maxLength: 2,
                  style: MyTextStyle.estiloBold(20, Colors.white),
                  decoration: InputDecoration(
                    //sborder: InputBorder,
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                    hintText: '11',
                    hintStyle: MyTextStyle.estiloBold(20, Colors.white),
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
    return Container(
        margin: EdgeInsets.all(10),
    height: 70,
    width: 150,
    decoration: new BoxDecoration(
    color: MyColors.ContainerColor,
    ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            top: 5, left: 5,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Fecha fin",
                  style: MyTextStyle.estiloBold(13, Colors.white),
                ),
            ),
          ),
          Positioned.fill(
            top: 12, left: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30, width: 95,
                child:TextField(
                  style: MyTextStyle.estiloBold(13, Colors.white),
                  onTap: (){
                    showDateNative();
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
                    hintStyle: MyTextStyle.estiloBold(13, Colors.white),
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
          Positioned.fill(
              top: 7,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 30,
                color: Colors.lightGreenAccent,
                onPressed: () {
                  datePicker();
                },),
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
            dialogBackgroundColor: MyColors.ContainerColor,
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
                dialogBackgroundColor: MyColors.ContainerColor,
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




