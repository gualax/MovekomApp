
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalHome extends StatefulWidget {
  @override
  _PrincipalHomeState createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Row( /// elementos uno al lado del otro
            children: <Widget>[
              leftSection(),
              rigtSection(),
            ],
        ),
      );
  }

  Widget rigtSection(){
    return
      Expanded(
        child: Container (
          padding: const EdgeInsets.all(15),
          child:
          Column(  /// Elementos uno arriba del otro
            children: <Widget>[
              status(),
              electricSystem("Electric System"),
              electricSystem("Water System"),
              conectionBoxes(),
            ],
          ),
        ),
      );
  }


  Widget status(){
    return
      Expanded(
        child:   Row (
          children: <Widget>[
            conectionBox(),
             Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin:EdgeInsets.all(5),
              child: Column (
                  children: <Widget>[
                    Container (
                      child:Text("         Status         "),
                    ),
                  ]),
            ),
          ],
        ),
      );
  }

  Widget electricSystem(text){
    return
      Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column (
                        children: <Widget>[
                          Text(text),
                          Row(
                              children: <Widget>[
                                Icon(Icons.radio_button_unchecked,size: 100, color: Colors.green),
                                Icon(Icons.radio_button_unchecked,size: 100, color: Colors.green),
                                Icon(Icons.radio_button_unchecked,size: 100, color: Colors.green),
                                Icon(Icons.radio_button_unchecked,size: 100, color: Colors.green),
                              ],
                          ),
                        ],
                ),
          ),
      );
  }
  

  Widget leftSection(){
    return
    Expanded(
      child: Container (
      padding: const EdgeInsets.all(15),
      child:
      Column(  /// Elementos uno arriba del otro
        children: <Widget>[
          movekomTitle(),
          imageRow(),
          accesoriesAndOutsideWeather(),
          conectionBoxes(),
        ],
      ),
    ),
    );
  }

  Widget movekomTitle() {
    return
      //       Expanded (
      Column(
        //    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*2*/
          Container(
        //    padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'MOVEKOM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Nutic and Automotive control systems',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
        //       ),
      );
  }

  Widget imageRow(){
  return
    Expanded(
     child: Image.asset( 'assets/images/CamperResizedImage.jpg'),
   );
  }

  Widget accesoriesAndOutsideWeather(){
    return
     Expanded(
      child:   Row (
           children: <Widget>[
             accesories(),
             weather(),
           ],
          ),
      );
  }

  Widget accesories(){
    return
     Expanded(
     child: Container(
       decoration: BoxDecoration(
           color: Colors.grey,
           borderRadius: BorderRadius.all(Radius.circular(10.0))),
       margin:EdgeInsets.all(5),
       child: Column (
          children: <Widget>[
            Container (
                child:Text("Accesories"),
            ),

            Container(
              child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 2,
              children: List.generate(6, (index) {
                  return Center(
                  child: Icon(Icons.home),
                  );
                }),
              ),
            ),
          ],
    ),
     ),
     );

  }

  Widget weather(){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin:EdgeInsets.all(5),
          child: Column (
              children: <Widget>[
                  Container (
                  child:Text("weather"),
               ),
              ]),
    ),
  );
  }

  Widget conectionBoxes(){
    return
      Expanded(
        child:   Row (
          children: <Widget>[
            conectionBox(),
            conectionBox(),
          ],
        ),
      );
  }

  Widget conectionBox(){
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        margin:EdgeInsets.all(5),
        child: Column (
            children: <Widget>[
              Container (
                child:Text("Conection box"),
              ),
            ]),
      ),
    );

  }
}

