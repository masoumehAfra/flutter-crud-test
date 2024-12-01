import 'package:equatable/equatable.dart';

class DateEntity extends Equatable {
  final int year;
  final int month;
  final int day;

  const DateEntity({
    required this.year,
    required this.month,
    required this.day,
  });

  DateTime get toDateTime {
    return DateTime(
      year,
      month,
      day,
    ).toLocal();
  }

  @override
  List<Object?> get props => [year, month, day];
}
