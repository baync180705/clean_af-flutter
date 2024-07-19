import 'package:clean_af/presentation/time_slot/time_slot.dart';
import 'package:clean_af/presentation/adv_payment/adv_payment.dart';
import 'package:flutter/material.dart';

Map <String, Widget Function(BuildContext)> routes = {
  '/': (context)=> const TimeSlotPage(),
  '/payment': (context)=> const AdvPayement(),
};