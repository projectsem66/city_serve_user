import
'package:flutter/material.dart'
;
import
'package:fluttertoast/fluttertoast.dart'
;
class Utils {
  void tostmessage(String message) {
    Fluttertoast.
    showToast
      (
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.
        transparent
        ,
        textColor: Colors.
        black
        ,
        fontSize: 16.0
    );
  }
}