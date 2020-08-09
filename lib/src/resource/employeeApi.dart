import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client, Response;
import 'package:statemanage/src/models/employee.dart';

// Network call done here.
// Calling for employee list
// returns data in json {"status" : "statusCode", "message": "string", "data": "dynamic"}
class EmployeeApiProvidrer {
  Client client = Client();

  Future<EmployeeList> fetchEmployeeList({String start}) async {
    Response response =
        await client.post('http://192.168.43.117:8088/employeelist', headers: {
      HttpHeaders.contentTypeHeader:
          'application/x-www-form-urlencoded; charset=UTF-8',
      HttpHeaders.authorizationHeader: ''
    }, body: {
      // Setting Formdata rather then url body.
      'start': '0',
      'limit': start
    });
    // Checking if request was an success.
    if (response.statusCode == 200) {
      return EmployeeList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
