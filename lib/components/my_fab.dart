import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends  StatelessWidget{
  const MyFloatingActionButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
   return  FloatingActionButton(
     backgroundColor: Colors.green.shade300,
       onPressed: onPressed,
     child:  const Icon(CupertinoIcons.add,
     color: Colors.black,),
   );
  }


}