import 'package:statemanage/src/models/response.dart';

class Employee {
  int _employeeId;
  String _profileUrl;
  String _firstname;
  String _lastname;
  String _contactNo;
  String _emailId;
  String _addressLine1;
  String _addressLine2;
  String _city;
  String _state;
  String _country;
  String _zipcode;

  Employee(employee) {
    _employeeId = employee["employeeId"];
    _profileUrl = employee["profileUrl"];
    _firstname = employee["firstname"];
    _lastname = employee["lastname"];
    _contactNo = employee["contactNo"];
    _emailId = employee["emailId"];
    _addressLine1 = employee["addressLine1"];
    _addressLine2 = employee["addressLine2"];
    _city = employee["city"];
    _state = employee["state"];
    _country = employee["country"];
    _zipcode = employee["zipcode"];
  }
  int get employeeId => _employeeId;
  String get profileUrl => _profileUrl;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get contactNo => _contactNo;
  String get emailId => _emailId;
  String get addressLine1 => _addressLine1;
  String get addressLine2 => _addressLine2;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zipcode => _zipcode;
}

class EmployeeList {
  List<Employee> _employeeList;
  EmployeeList();

  EmployeeList.fromJson(Map<String, dynamic> parsedJson) {
    ResponseData _data = ResponseData.fromJson(parsedJson);
    List<Employee> temp = [];
    if (_data.data != null) {
      for (var i = 0; i < _data.data.length; i++) {
        Employee emp = Employee(_data.data[i]);
        temp.add(emp);
      }
    }
    _employeeList = temp;
  }
  List<Employee> get employeeList => _employeeList;
}
