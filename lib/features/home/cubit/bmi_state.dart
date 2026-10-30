// lib/features/home/cubit/bmi_state.dart

class BmiState {
  final String gender;
  final double height;
  final int age;
  final int weight;

  const BmiState({
    this.gender = '',
    this.height = 150,
    this.age = 22,
    this.weight = 70,
  });

  // States are immutable, so to "change" one we build a modified copy.
  BmiState copyWith({String? gender, double? height, int? age, int? weight}) {
    return BmiState(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      age: age ?? this.age,
      weight: weight ?? this.weight,
    );
  }
}
