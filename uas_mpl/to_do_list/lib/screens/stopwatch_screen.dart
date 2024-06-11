import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:audioplayers/audioplayers.dart';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  late Duration _timerDuration;
  late Duration _remainingTime;
  late AudioCache _audioCache;
  Timer? _timer;
  bool _isRunning = false;
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _timerDuration = Duration(hours: 0, minutes: 0, seconds: 0);
    _remainingTime = _timerDuration;
    _audioCache = AudioCache(prefix: 'assets/audio/');
    _audioCache.load('notification.mp3');
    _noteController = TextEditingController();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      _isRunning = true;
      _remainingTime = _timerDuration;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = _remainingTime - Duration(seconds: 1);
        });
      } else {
        _timer!.cancel();
        _playNotificationSound();
        setState(() {
          _isRunning = false;
        });
        _showTimerEndDialog();
      }
    });
  }

  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _isRunning = false;
      _timerDuration = Duration(hours: 0, minutes: 0, seconds: 0);
      _remainingTime = _timerDuration;
      _noteController.clear();
    });
  }

  void _playNotificationSound() {
    _audioCache.play('notification.mp3');
  }

  void _showTimerEndDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Timer Ended'),
          content: Text('The timer has finished.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: _timerDuration.inHours,
                  minValue: 0,
                  maxValue: 23,
                  onChanged: (value) {
                    setState(() {
                      _timerDuration = Duration(
                        hours: value,
                        minutes: _timerDuration.inMinutes % 60,
                        seconds: _timerDuration.inSeconds % 60,
                      );
                      _remainingTime = _timerDuration;
                    });
                  },
                ),
                SizedBox(width: 20),
                NumberPicker(
                  value: _timerDuration.inMinutes % 60,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (value) {
                    setState(() {
                      _timerDuration = Duration(
                        hours: _timerDuration.inHours,
                        minutes: value,
                        seconds: _timerDuration.inSeconds % 60,
                      );
                      _remainingTime = _timerDuration;
                    });
                  },
                ),
                SizedBox(width: 20),
                NumberPicker(
                  value: _timerDuration.inSeconds % 60,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (value) {
                    setState(() {
                      _timerDuration = Duration(
                        hours: _timerDuration.inHours,
                        minutes: _timerDuration.inMinutes % 60,
                        seconds: value,
                      );
                      _remainingTime = _timerDuration;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter note (optional)',
              ),
              onChanged: (value) {
              },
              controller: _noteController,
            ),
            SizedBox(height: 20),
            Text(
              '${_remainingTime.inHours.toString().padLeft(2, '0')}:${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer,
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: !_isRunning ? null : _pauseTimer,
                  child: Text('Pause'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
