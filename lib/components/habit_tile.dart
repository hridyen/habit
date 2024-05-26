import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget{


   final String  habitName;
   final bool habitCompleted;
   final Function (bool?)? onChanged;
   final Function(BuildContext)? settingsTapped;
   final Function(BuildContext)? deleteTapped;

  const HabitTile({super.key,
    required this.habitName,
    required this.habitCompleted,
  required this.onChanged,
  required this.settingsTapped,
  required this.deleteTapped,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion:  StretchMotion(),
            children: [
              //settings
              SlidableAction(
                  onPressed: settingsTapped,
                backgroundColor: Colors.grey.shade800,
                icon: Icons.settings,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              //deletion
              SlidableAction(
                onPressed: deleteTapped,
                backgroundColor: Colors.red.shade700,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ]),
        child: Container(
          padding: EdgeInsets.all(24.0),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.green,

                checkColor: Colors.white,
                  value: habitCompleted,
                  onChanged: onChanged ,
              ),
              Text(habitName, style: TextStyle(fontSize: 16),),
              Spacer(),
              Icon(Icons.arrow_left, size: 26,)
            ],
          ),
        ),
      ),
    );
  }

}