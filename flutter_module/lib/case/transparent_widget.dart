import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'native_view.dart';

/// For translucent dialog demo
class TransparentWidget extends StatefulWidget {
  @override
  TransparentWidgetState createState() => TransparentWidgetState();
}

class TransparentWidgetState extends State<TransparentWidget> {
  final Color _myColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00000000),
        body: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(color: const Color(0xffffffff), border: Border.all(color: _myColor, width: 5.0)),
            height: 400,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 90,
                  child: NativeView('<simple-text-view>', false),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(8.0),
                            color: Colors.yellow,
                            child: const Text(
                              'Go Back',
                              style: TextStyle(fontSize: 18.0, color: Colors.black),
                            )),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      InkWell(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(8.0),
                            color: Colors.yellow,
                            child: const Text(
                              'Open New Dialog',
                              style: TextStyle(fontSize: 18.0, color: Colors.black),
                            )),
                        onTap: () => BoostNavigator.instance.push("transparentWidget", withContainer: true, opaque: false),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(8.0),
                            color: Colors.yellow,
                            child: const Text(
                              'Open Native Page',
                              style: TextStyle(fontSize: 18.0, color: Colors.black),
                            )),
                        onTap: () => BoostNavigator.instance.push("native"),
                      ),
                      InkWell(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(8.0),
                            color: Colors.yellow,
                            child: const Text(
                              'Open Flutter Page',
                              style: TextStyle(fontSize: 18.0, color: Colors.black),
                            )),
                        onTap: () => BoostNavigator.instance.push("flutterPage", withContainer: true),
                      ),
                    ],
                  ),
                ]),
              ),
            ]),
          ),
        ));
  }
}
