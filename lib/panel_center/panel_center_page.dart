import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/panel_center/liner_chart.dart';

class Person {
  String name;
  Color color;

  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  _PanelCenterPageState createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  List<Person> _persons = [
    Person(name: "Theia Bowen", color: Constants.orangeLight),
    Person(name: "Faruha Odling", color: Constants.redLight),
    Person(name: "Viola Willis", color: Constants.blueLight),
    Person(name: "Emmett Forrest", color: Constants.orangeLight),
    Person(name: "Nick Jarvis", color: Constants.greenLight),
    Person(name: "Amit Claveia", color: Constants.redLight),
    Person(name: "Campell Howardeia", color: Constants.orangeLight),
    Person(name: "Haley Mellor", color: Constants.blueLight),
    Person(name: "Harlen higgins", color: Constants.greenLight),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: Constants.kPadding / 2,
              right: Constants.kPadding / 2,
              top: Constants.kPadding / 2,
            ),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                child: ListTile(
                  title: Text(
                    "Products Available",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text("82% of Products Available",
                      style: TextStyle(color: Colors.white)),
                  trailing: Chip(
                      label: Text(
                    "20,500",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
          BarChartSample2(),
          Padding(
            padding: const EdgeInsets.only(
              left: Constants.kPadding / 2,
              right: Constants.kPadding / 2,
              top: Constants.kPadding,
              bottom: Constants.kPadding,
            ),
            child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                    _persons.length,
                    (index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _persons[index].color,
                          radius: 15,
                          child: Text(
                            _persons[index].name.substring(0, 1),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(_persons[index].name,
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.message, color: Colors.white),
                        )),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
