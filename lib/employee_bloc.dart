//Step 1: Imports
//Step 2: List of Employees
//Step 3: Stream Controllers
//Step 4: Stream Sink Getter
//Step 5: Constructor - add data; listen to changes
//Step 6: Core Functions
//Step 7: Dispose

import 'dart:async';
import 'employee.dart';

class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1, 'Employee One', 10000.0),
    Employee(2, 'Employee Two', 20000.0),
    Employee(3, 'Employee Three', 30000.0),
    Employee(4, 'Employee Four', 40000.0),
    Employee(5, 'Employee Five', 50000.0),
  ];

  //StreamControllers
  // ignore: close_sinks
  final _employeeListStreamController = StreamController<List<Employee>>();
  // ignore: close_sinks
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  // ignore: close_sinks
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  // Sink and Streams
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;
  StreamSink<Employee> get employeeSalaryIncrementSink => _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrementSink => _employeeSalaryDecrementStreamController.sink;

  //Constructor - add data; listen to changes
  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.getSalary;
    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.getId - 1].setSalary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.getSalary;
    double decrementedSalary = salary * 20 / 100;
    _employeeList[employee.getId - 1].setSalary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

//Dispose the streams

  void dispose() {
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }

}
