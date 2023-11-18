import 'dart:async';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key, required this.second});
  final int second;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  int _countdown = 0;

  @override
  void initState() {
    super.initState();
    _countdown = widget.second;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer.cancel();
        // Implement logic when the timer reaches 0
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _countdown == 0 ? () {} : null,
      child: Text(
        _countdown == 0 ? 'Yenidən göndər' : 'Yenidən göndər (${_countdown}s)',
        style: getRegularStyle(color: ColorManager.mainBlue, fontSize: 14),
      ),
    );
  }
}
