part of 'time_slot_bloc.dart';

abstract class TimeSlotState extends Equatable {
  const TimeSlotState();
  
  @override
  List<Object> get props => [];
}

final class DisplayTimeSlot extends TimeSlotState {
  final TextEditingController timeSlotController;
  const DisplayTimeSlot({required this.timeSlotController});

  @override 
  List<TextEditingController> get props => [timeSlotController];
}
