import 'package:attendence_app/FrontScreen/profile.dart';
import 'package:flutter/material.dart';

class AddLecForm extends StatefulWidget {
  const AddLecForm({Key? key}) : super(key: key);

  @override
  State<AddLecForm> createState() => _AddLecFormState();
}

class _AddLecFormState extends State<AddLecForm> {
  @override
  Widget build(BuildContext context) {
    String dayVal = "Monday";
    String startTimeVal = "09:30";
    String endTimeVal = "09:30";
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var time = ["09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Lecture Timings"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.face),
            tooltip: "Profile",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Profile()
                  )
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Form(
          child: Center(
            child: Column(
              children: <Widget> [
                DropdownButton(
                  hint: const Text("Select Day"),
                  items: days.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Center(child: Text(items)),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      dayVal = newVal!;
                    });
                  }
                ),
                DropdownButton(
                  menuMaxHeight: 300.0,
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Select Start Time"),
                    ),
                    items: time.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Center(child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        startTimeVal = newVal!;
                      });
                    }
                ),
                DropdownButton(
                    menuMaxHeight: 300.0,
                    hint: const Text("Select End Time"),
                    items: time.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Center(child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        endTimeVal = newVal!;
                      });
                    }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int value = checkTime(startTimeVal, endTimeVal);
                      // data will saved in excel sheet
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int checkTime(startTimeVal, endTimeVal) {
    if (startTimeVal > endTimeVal) {
      return 1;
    }
    else {
      return 0;
    }
  }
}
