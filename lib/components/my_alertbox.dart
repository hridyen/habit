import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertbox extends StatelessWidget{

  final controller;
final  VoidCallback onSave;
final VoidCallback onCancel;
final  String hintText;
  const MyAlertbox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  required this.hintText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          )
        ),
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.text,
      ),
      actions: [
      MaterialButton(onPressed: onSave,
        child: Text(
        "Save",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        color: Colors.black54,

      ),
        MaterialButton(onPressed: onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          color: Colors.black54,

        ),

        ]
    );
  }

}