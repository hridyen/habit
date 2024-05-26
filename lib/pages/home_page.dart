import 'package:flutter/material.dart';
import 'package:habit/components/month_summary.dart';
import 'package:habit/data/habit_database.dart';
import 'package:hive/hive.dart';

import '../components/habit_tile.dart';
import '../components/my_fab.dart';
import '../components/my_alertbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // Data structure for today's habit list
 HabitDatabase  db = HabitDatabase();
 final _myBox = Hive.box("Habit_Database");

 @override
  void initState() {
    // if  there is  no current  habt list, then it is the  1st time  ever opening the app
   //then  create  default  data
   if(_myBox.get("CURRENT_HABIT_LIST")== null ){
     db.createDefaultData();
   }else{
    db.loadData();
   }
   db.updateData();
    super.initState();
  }
  // Checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
     db.todaysHabitList[index][1] = value;
    });
    db.updateData();
  }

  // Create a new habit
  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    // Show alert dialog box
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertbox(
          controller: _newHabitNameController,
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
          hintText: " Enter a Habit",

        );
      },
    );
  }

  // Save new habit
  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
      _newHabitNameController.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // Cancel dialog box
  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // Open habit settings
  void openHabitSettings(int index) {
    _newHabitNameController.text = db.todaysHabitList[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertbox(
          controller: _newHabitNameController,
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
          hintText: db.todaysHabitList[index][0],
        );
      },
    );
  }

  // Save existing habit
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();

    Navigator.of(context).pop();
    db.updateData();
  }

  // Delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewHabit,
      ),
      body: ListView(
        children: [
          MonthlySummary(
          datasets:
          db.heatMapDataSet,
          startDate: _myBox.get("START_DATE")),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value, index),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            },
          ),
        ],
      )
    );
  }
}

