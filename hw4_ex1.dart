// Exercise 1: Employee Class
// create enum
enum Skill { FLUTTER, DART, PYTHON, OTHER }

// create address class
class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);
}

// create employee class
class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  // constructor
  Employee(this._name, this._address, this._yearsOfExperience, this._skills)
    : _baseSalary = 40000;

  // name constructors
  Employee.mobileDev(
    String name,
    int yearsOfExperience,
    Address address,
  ) : _name = name,
      _baseSalary = 40000,
      _address = address,
      _yearsOfExperience = yearsOfExperience,
      _skills = [Skill.DART, Skill.FLUTTER];

  Employee.dataAnalyst(
    { required String name,
    required int yearsOfExperience,
    required Address address,}
  ) : _name = name,
      _baseSalary = 40000,
      _address = address,
      _yearsOfExperience = yearsOfExperience,
      _skills = [Skill.PYTHON];

  // make getters to get the attributes
  String get name => _name;
  int get yearsOfExperience => _yearsOfExperience;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  double get baseSalary => _baseSalary;

  // compute method
  double compute() {

    // for every years of exp, add 2000
    double sumExperience = yearsOfExperience * 2000;
    double sumSkill = 0.0;

    // loop through skills to add bonuses
    for (var skill in _skills) {
      switch (skill) {
        case Skill.DART:
          sumSkill += 3000;
          break;
        case Skill.FLUTTER:
          sumSkill += 5000;
          break;
        case Skill.PYTHON:
          sumSkill += 4000;
          break;
        case Skill.OTHER:
          sumSkill += 1000;
          break;
      }
    }
    return _baseSalary + sumExperience + sumSkill;
  }
}
void main() {
  var officeAdd = Address("Petal Street", "Phnom Penh", "120802");

  var standardEmp1 = Employee("Max", officeAdd, 2, [Skill.FLUTTER, Skill.DART]);
  var standardEmp2 = Employee("Mark", officeAdd, 3, [Skill.FLUTTER]);

  var mobileDev = Employee.mobileDev("Tony", 10, officeAdd);

  print("Salary Specification:");
  print("\nBase Salary: \$40000.");
  print("\nEach years of experience adds \$2000.");
  print("\nEach skills adds a different bonus:");
  print("\n\tFlutter: \$5000.");
  print("\tPython:  \$4000.");
  print("\tDart:    \$3000.");
  print("\tOther:   \$1000.");
  print("\n");
  print(
    "${standardEmp1._name},Location: ${standardEmp1._address.city} Salary: ${standardEmp1.compute()}, Years of Experience: ${standardEmp1._yearsOfExperience}, Skills: ${standardEmp1._skills}",
  );

  print(
    "${standardEmp2._name}, Salary: ${standardEmp2.compute()}, Years of Experience: ${standardEmp2._yearsOfExperience}, Skills: ${standardEmp2._skills}",
  );

  print(
    "${mobileDev._name}, Salary: ${mobileDev.compute()}, Years of Experience: ${mobileDev._yearsOfExperience}, Skills: ${mobileDev._skills}",
  );
}
