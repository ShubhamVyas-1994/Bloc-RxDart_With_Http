import 'package:flutter/material.dart';
import 'package:statemanage/src/bloc/employeeBloc.dart';
import 'package:statemanage/src/models/employee.dart';

class EmployeeListWidget extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeListWidget> {
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    bloc.fetchAllEmployees();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        bloc.loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.allEmployees,
      builder: (BuildContext context, AsyncSnapshot<EmployeeList> snapshot) {
        if (snapshot.hasData) {
          return listBuilder(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget listBuilder(AsyncSnapshot<EmployeeList> _snapshot) {
    return RefreshIndicator(
        child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8),
            itemCount: _snapshot.data.employeeList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < _snapshot.data.employeeList.length) {
                return Dismissible(
                    onDismissed: null,
                    background: Card(
                      color: Colors.red,
                      child: Container(),
                    ),
                    key: UniqueKey(),
                    child: Container(
                      child: Card(
                        color: Colors.blue[50],
                        child: ListTile(
                          onTap: () {},
                          subtitle: Text(
                              _snapshot.data.employeeList[index].contactNo),
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            backgroundImage: NetworkImage(
                                _snapshot.data.employeeList[index].profileUrl),
                          ),
                          trailing: Text(index.toString()),
                          title: Text(
                              _snapshot.data.employeeList[index].firstname +
                                  ' ' +
                                  _snapshot.data.employeeList[index].lastname),
                        ),
                      ),
                    ));
              } else if (bloc.maxLimitOfData > index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(child: Text('nothing more to load!')),
                );
              }
            }),
        onRefresh: bloc.refreshEmployeeList);
  }
}
