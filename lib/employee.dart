class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  //setters
  set setId(int id) => this._id = id;
  set setName(String name) => this._name = name;
  set setSalary(double salary) => this._salary = salary;

  //getters
  int get getId => this._id;
  String get getName => this._name;
  double get getSalary => this._salary;
}
