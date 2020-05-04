import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double horizontalPixel;
  static double verticalPixel;
  static double h;
  static double v;
  static double p;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - _safeAreaVertical)/100;
    // modo de uso multiplicar el num que necesito por los ...Pixel
    // ejemplo: horizontalPixel x 30px (width)
    horizontalPixel = (1 / screenWidth) * 1000 ;
    verticalPixel = (1 / screenHeight) * 1000;
    h = blockSizeHorizontal;
    v = blockSizeVertical;
    p = (h + v) / 2;
  }

  static double x(num){
    return h * num;
  }

  static double y(num){
    return v * num;
  }

  static double all(num){
    return p * num;
  }

}