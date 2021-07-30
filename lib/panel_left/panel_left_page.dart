import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/panel_left/circle_chart.dart';
import 'package:responsive_dashboard/panel_left/curved_chart.dart';
import 'package:responsive_dashboard/responsive_layout.dart';

class Todo {
  String name;
  bool enable;

  Todo({required this.name, this.enable = true});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  List<Todo> _toDo = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Marketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        if (ResponsiveLayout.isComputer(context))
          Container(
            color: Constants.purpleLight,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
            ),
          ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Constants.kPadding / 2,
                  right: Constants.kPadding / 2,
                  top: Constants.kPadding / 2,
                ),
                child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text("18% of Products Sold",
                            style: TextStyle(color: Colors.white)),
                        trailing: Chip(
                            label: Text(
                          "4,500",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )),
              ),
              LineChartSample2(),
              PieChartSample2(),
              Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                    bottom: Constants.kPadding,
                  ),
                  child: Card(
                      color: Constants.purpleLight,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          children: List.generate(
                              _toDo.length,
                              (index) => CheckboxListTile(
                                  title: Text(_toDo[index].name,
                                      style: TextStyle(color: Colors.white)),
                                  value: _toDo[index].enable,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _toDo[index].enable = newValue ?? true;
                                    });
                                  })))))
            ],
          ),
        )
      ],
    ));
  }
}
