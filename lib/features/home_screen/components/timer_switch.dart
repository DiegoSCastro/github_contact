import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class TimerSwitch extends StatefulWidget {
  final int duration;
  final VoidCallback onRefreshTimer;

  const TimerSwitch({
    Key? key,
    required this.onRefreshTimer,
    this.duration = 15,
  }) : super(key: key);

  @override
  State<TimerSwitch> createState() => _TimerSwitchState();
}

class _TimerSwitchState extends State<TimerSwitch> {
  int time = 15;
  Timer? _timer;
  bool enabled = true;
  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void _startTimer() {
    if (enabled == false) {
      return;
    }
    time = widget.duration;

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (enabled == false) {
        return;
      }
      setState(() {
        if (time == 0) {
          widget.onRefreshTimer();
          time = 15;

          return;
        }
        time--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('${Locales.string(context, 'auto_refresh')}   ${enabled ? time : ''}'),
      onChanged: (bool value) {
        setState(() {
          enabled = value;
        });
        if (enabled) {
          time = 15;
        }
      },
      value: enabled,
    );
  }
}
