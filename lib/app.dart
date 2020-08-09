import 'package:flutter/material.dart';
import 'package:statemanage/src/ui/employeeList.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Level Management'),
        backgroundColor: Colors.blue,
      ),
      body: EmployeeListWidget(),
    );
  }
}
