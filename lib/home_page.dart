import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _touched = false;
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: _superman(),
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Text(
              'Toggle animation:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _smileSwitch(),
          )
        ],
      ),
    );
  }

  Widget _smileSwitch() {
    return Container(
      height: 300,
      child: CupertinoButton(
        onPressed: () => setState(() {
          _enabled = !_enabled;
          _touched = true;
        }),
        child: FlareActor(
          'assets/smile_switch.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: !_touched ? 'idle' : _enabled ? 'enable' : 'disable',
          shouldClip: false,
        ),
      ),
    );
  }

  Widget _superman() {
    return Container(
      height: 300,
      child: FlareActor(
        'assets/superman.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'wave',
        isPaused: !_enabled,
        shouldClip: false,
      ),
    );
  }
}
