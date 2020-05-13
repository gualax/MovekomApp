import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class CustomWidget extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;



  const CustomWidget({
    Key key,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
  })  : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return iconBuble();
  }

  Widget iconBuble() {
    return GestureDetector(
             onTap: widget.onSelect,
              child: Container(
                width: 83,
                height: 83,
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child:Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/icon_boiler_5.svg", widget.isSelected ? Colors.red : Colors.yellow, 40)
                      ),
                    ),
                    Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(widget.index.toString(),style: MyTextStyle.estiloBold(10, Colors.white),),
                        )
                    )
                  ],
                ),
              ),
      );
  }
}


