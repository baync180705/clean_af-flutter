part of 'time_slot_bloc.dart';

class TimeSlotEvent extends Equatable {
  final TimeOfDay? pickedTime;
  const TimeSlotEvent({required this.pickedTime});

  @override
  List<TimeOfDay?> get props => [pickedTime];
}
