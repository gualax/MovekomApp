


import 'package:flutter/material.dart';
import 'package:movekomapp/Menu1.dart';
import 'package:movekomapp/MenuMapping.dart';

class FloatingMenu extends StatefulWidget {
  @override
  FloatingMenuState createState() => FloatingMenuState();
}

class FloatingMenuState extends State<FloatingMenu> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: ListView.separated(
          separatorBuilder: (context, int) {
            return Divider(color: Colors.black,);
          },
          // shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              childAspectRatio: 2,
              children: List.generate(20, (index) {
                return Center(
                  child: botoncito(index),
                );
              }),
            );
          },
          itemCount: 1,
        ));
  }


  Widget botoncito(index){
    return ButtonTheme(
      minWidth:200,
      height: 100,
      child: RaisedButton(
        onPressed: () {
          goToSelectedScreen(index);
        },
        child: Text("Menu" + index.toString()),
      ),
    );
  }

   goToSelectedScreen(index) async{
    print("index:" + index.toString());
    print("go to :" +  MenuMapping.getMenuStringRoute(index));
    final result = await Navigator.pushNamed(
      context, "/menu1");

   }

  }



