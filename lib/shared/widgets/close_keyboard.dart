import 'package:flutter/material.dart';


class Close{
  static void closeKeyboard(BuildContext context){
    FocusScope.of(context).unfocus();
  }
}
