import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences mypref =
                        await SharedPreferences.getInstance();
                    mypref.setString('Name', 'Salma');
                    mypref.setDouble('Age', 23);
                    mypref.setStringList('Hobbies', ['Swimming', 'Dancing']);
                  },
                  child: Text("Save in Shared Preference")),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences mypref =
                        await SharedPreferences.getInstance();
                    String? name = mypref.getString('Name');
                    double? age = mypref.getDouble('Age');
                    List<String>? hobbies = mypref.getStringList('Hobbies');
                    print(name);
                    print(age);
                    print(hobbies);
                  },
                  child: Text("Print the saved Data")),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences mypref =
                        await SharedPreferences.getInstance();
                    mypref.setString('Name', 'Amal');
                  },
                  child: Text("Update the Name key in shared preference")),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences mypref =
                        await SharedPreferences.getInstance();
                    mypref.clear();
                  },
                  child: Text("Reset the whole Data")),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences mypref =
                        await SharedPreferences.getInstance();
                    mypref.remove('Hobbies');
                  },
                  child: Text("Deleting the Hobbies"))
            ],
          ),
        ),
      ),
    );
  }
}
