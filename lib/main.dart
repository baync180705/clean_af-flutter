import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_af/presentation/time_slot/bloc/time_slot_bloc.dart';
import 'package:clean_af/routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeSlotBloc>(create: (context)=>TimeSlotBloc())
      ],
      child: MaterialApp(
        title: 'cleanAF!',
        theme: ThemeData(
          timePickerTheme: TimePickerThemeData(backgroundColor: Colors.amber[300]),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: routes,
        initialRoute: '/',
        ),
    )
    ;
  }
}

