// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
class Customdialog extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final content;
  final VoidCallback callback;
  // ignore: prefer_typing_uninitialized_variables
  final actionText;
   // ignore: use_key_in_widget_constructors
   const Customdialog(this.title,this.content, this.callback, [this.actionText="Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(onPressed: callback,color:Colors.white, child: Text(actionText),),
      ],
    );
    
  }
}