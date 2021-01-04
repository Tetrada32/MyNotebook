import "dart:io";
import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";
import "appointments/Appointments.dart";
import "contacts/Contacts.dart";
import "notes/Notes.dart";
import "tasks/Tasks.dart";
import "utils.dart" as utils;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  startMeUp() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    utils.docsDir = docsDir;
    runApp(FlutterBook());
  }

  startMeUp();
}

/// ********************************************************************************************************************
/// Main app widget.
/// ********************************************************************************************************************
class FlutterBook extends StatelessWidget {
  Widget build(BuildContext inContext) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                    title: Text("MyNotebook"),
                    bottom: TabBar(tabs: [
                      Tab(icon: Icon(Icons.date_range), text: "Встречи"),
                      Tab(icon: Icon(Icons.note), text: "Заметки"),
                      Tab(
                          icon: Icon(Icons.assignment_turned_in),
                          text: "Задачи"),
                      Tab(icon: Icon(Icons.contacts), text: "Контакты"),
                    ])),
                body: TabBarView(children: [
                  Appointments(),
                  Notes(),
                  Tasks(),
                  Contacts(),
                ]))));
  }
}
