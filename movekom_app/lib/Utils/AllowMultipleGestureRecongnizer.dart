import 'package:flutter/gestures.dart';

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
      super.acceptGesture(pointer);
  }
}



class AllowOnlyChildGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    super.rejectGesture(pointer);
  }
}


