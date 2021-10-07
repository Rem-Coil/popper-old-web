import 'package:flutter/material.dart';
import 'package:popper/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Popper demo page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskBobina> listOfBobinas = [
    TaskBobina(
        nameOfTask: "АЭ-113-4", numberOfTask: "23-09-21", numberOfBobinas: 60),
    TaskBobina(
        nameOfTask: "ДАЗ4-400-4",
        numberOfTask: "24-09-21",
        numberOfBobinas: 50),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
    TaskBobina(
        nameOfTask: "СТД-1000-6",
        numberOfTask: "25-09-21",
        numberOfBobinas: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('Number'),
                        ),
                        DataColumn(
                          label: Text('Count'),
                        ),
                        DataColumn(
                          label: Text('Winding'),
                        ),
                        DataColumn(
                          label: Text('Output'),
                        ),
                        DataColumn(
                          label: Text('Isolation'),
                        ),
                        DataColumn(
                          label: Text('Molding'),
                        ),
                        DataColumn(
                          label: Text('Crimping'),
                        ),
                        DataColumn(
                          label: Text('Quality'),
                        ),
                        DataColumn(
                          label: Text('Testing'),
                        ),
                        DataColumn(label: Text('')),
                      ],
                      rows: listOfBobinas
                          .map((bobina) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(bobina.nameOfTask)),
                                  DataCell(Text(bobina.numberOfTask)),
                                  DataCell(
                                      Text(bobina.numberOfBobinas.toString())),
                                  DataCell(Text(bobina.winding.toString())),
                                  DataCell(Text(bobina.output.toString())),
                                  DataCell(Text(bobina.isolation.toString())),
                                  DataCell(Text(bobina.molding.toString())),
                                  DataCell(Text(bobina.crimping.toString())),
                                  DataCell(Text(bobina.quality.toString())),
                                  DataCell(Text(bobina.testing.toString())),
                                  DataCell(ElevatedButton(
                                    child: Text('More information'),
                                    onPressed: () {
                                      print('button ${bobina.nameOfTask}');
                                    },
                                  ))
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
