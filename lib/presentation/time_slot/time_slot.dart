import 'dart:async';
import 'package:clean_af/presentation/time_slot/bloc/time_slot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSlotPage extends StatelessWidget {
  const TimeSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = '';
    bool isEnabled = false;
    Completer completer = Completer();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select time slot',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.amber,
      ),
      body: BlocListener<TimeSlotBloc, DisplayTimeSlot>(
        listener: (context, state) {
          controller.text = state.timeSlotController.text;
          isEnabled = (state.timeSlotController.text == ' ') ? false : true;
          completer.complete();
        },
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Time Slot in 24 hrs format:'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.27,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: controller,
                          readOnly: true,
                          onTap: () async {
                            completer = Completer();
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              context
                                  .read<TimeSlotBloc>()
                                  .add(TimeSlotEvent(pickedTime: pickedTime));
                              await completer.future;
                            }
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      if (isEnabled == true) {
                        Navigator.pushNamed(context, '/payment', arguments: {'appMetaList':'!!!!!!!'});
                      } else {
                        print('fail');
                        null;
                      }
                    },
                    child: const Text('Confirm'),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(10),boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 3, blurRadius: 6.0)]),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                              'Please note the following points:\n\n1)Service can only be booked for the next day.\n2)Worker is only available from 10am to 6pm. \n\t\t\t\t(10hrs to 18hrs)\n3)You must make a security payment of Rs.10 to continue.'),
                        ),
                            ),

                  )
                ])),
      ),
    );
  }
}
