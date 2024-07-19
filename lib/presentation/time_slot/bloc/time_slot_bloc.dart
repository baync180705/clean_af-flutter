import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'time_slot_event.dart';
part 'time_slot_state.dart';

class TimeSlotBloc extends Bloc<TimeSlotEvent, DisplayTimeSlot> {
  TimeSlotBloc() : super(DisplayTimeSlot(timeSlotController: TextEditingController())) {

    on<TimeSlotEvent>(_displayTimeSlot);
  }

  FutureOr<void> _displayTimeSlot(TimeSlotEvent event, Emitter<DisplayTimeSlot> emit) {
    TimeOfDay? pickedTime = event.pickedTime;
    TextEditingController timeSlotController = TextEditingController();
    String timeSlot = '${pickedTime!.hour}-${pickedTime.hour+1} hrs on ${DateTime.now().add(const Duration(days: 1)).toString().split(' ')[0]}';
    if(pickedTime.hour>=10 && pickedTime.hour<=17){
      timeSlotController.text = timeSlot;
    }
    else{
      timeSlotController.text = '';
    }
    print(timeSlotController.text);
    emit(DisplayTimeSlot(timeSlotController: timeSlotController));
  }
}
