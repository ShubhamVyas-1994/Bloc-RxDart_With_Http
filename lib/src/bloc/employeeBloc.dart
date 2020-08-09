import 'package:rxdart/rxdart.dart';
import 'package:statemanage/src/models/employee.dart';
import 'package:statemanage/src/resource/repository.dart';

class EmployeeBloc {
  // Consider it an repository of your api calls;
  final _repository = Repository();
  // It can be dynamic value which can be return from backend.
  final maxLimitOfData = 200;

  final _listFetcher = PublishSubject<EmployeeList>();
  // Well this var is used for infinite scrolling
  // Every time new data is fetched the limit will change as well
  int _setLimitForData = 20;

  Stream<EmployeeList> get allEmployees => _listFetcher.stream;

  // fetchAllEmployees will be called when app intialize
  fetchAllEmployees() async {
    EmployeeList itemModel =
        await _repository.fetchAllEmployees(_setLimitForData.toString());
    // setting new limit
    _setLimitForData = itemModel.employeeList.length;
    // Sinks data with stream
    _listFetcher.sink.add(itemModel);
  }

  // To Refresh Data manually
  Future<void> refreshEmployeeList() async {
    EmployeeList _employeeList =
        await _repository.fetchAllEmployees(_setLimitForData.toString());
    _listFetcher.sink.add(_employeeList);
    _setLimitForData = _employeeList.employeeList.length;
  }

  // loadMore will run whenever user scrolls for more data
  //
  Future<void> loadMore() async {
    if (maxLimitOfData > _setLimitForData) {
      EmployeeList _employeeList = await _repository
          .fetchAllEmployees((_setLimitForData + 20).toString());
      _listFetcher.sink.add(_employeeList);
      _setLimitForData = _employeeList.employeeList.length;
    }
  }

  // stream should be disposed closed.
  dispose() {
    _listFetcher.close();
  }
}

// Now we can access EmployeeBloc using 'bloc' var
final bloc = EmployeeBloc();
