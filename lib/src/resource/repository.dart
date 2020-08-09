import 'dart:async';

import 'package:statemanage/src/models/employee.dart';
import 'package:statemanage/src/resource/employeeApi.dart';

class Repository {
  final employeeListProvider = EmployeeApiProvidrer();
  // fetchAllEmployees can be used to call EmployeeList Api anywhere in project
  Future<EmployeeList> fetchAllEmployees(String start) =>
      employeeListProvider.fetchEmployeeList(start: start);
}
