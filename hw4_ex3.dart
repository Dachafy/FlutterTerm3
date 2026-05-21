// Exercise 3: Duration
class CustomDuration {
  final double _millisecond;

  CustomDuration.fromHours(double hours)
    : _millisecond = hours >= 0
          ? hours * 3600000
          : throw ArgumentError("Cannot be negative");

  CustomDuration.fromMinutes(double minutes)
    : _millisecond = minutes >= 0
          ? minutes * 60000
          : throw ArgumentError("Cannot be negative");

  CustomDuration.fromSeconds(double seconds)
    : _millisecond = seconds >= 0
          ? seconds * 1000
          : throw ArgumentError("Cannot be negative");

  CustomDuration.fromMilliseconds(this._millisecond);

  bool operator >(CustomDuration other) {
    return this._millisecond > other._millisecond;
  }

  CustomDuration operator +(CustomDuration other) {
    double plusNewDuration = this._millisecond + other._millisecond;
    return CustomDuration.fromMilliseconds(plusNewDuration);
  }

  CustomDuration operator -(CustomDuration other) {
    double minusNewDuration = this._millisecond - other._millisecond;
    if (minusNewDuration < 0) {
      throw Exception("Results cannot be less than 0.");
    } else {
      return CustomDuration.fromMilliseconds(minusNewDuration);
    }
  } 
    // without this, the result will output the instance of the class
    @override
    String toString() {
      return '$_millisecond ms';
    }
}
void main() {
  var mobileDevClass = CustomDuration.fromMinutes(100);
  var careerClass = CustomDuration.fromMinutes(50);

  var totalClass = mobileDevClass - careerClass;
  print("The total class time is: $totalClass");
}
