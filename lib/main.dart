import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
  <StreamSubscription<dynamic>>[];

  double topOne=0;
  double leftOne=0;
  double topTwo=100;

  String asset;
  double rate0 = -45,rateT0=-15;
  double rate1 = -45,rateT1=-15;
  double rate2 = -45,rateT2=-15;
  double rate3 = -45,rateT3=-15;
  double rate4 = -45,rateT4=-15;
  double rate5 = -45,rateT5=-15;
  double rate6 = -45,rateT6=-15;
  double rate7 = -45,rateT7=-15;
  double rate8 = -45,rateT8=-15;

  @override
  Widget build(BuildContext context) {
  final List<String> gyroscope =  _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    return Scaffold(
        body: Stack(
          children: [
           //Positioned(
           //  top: topOne,
           //  left: leftOne,
           //  child: Container(
           //    width: 100,
           //    height: 100,
           //    color: Colors.red,
           //    child: Text('Gyroscope: $gyroscope'),
           //  ),
           //),
            ParallaxWidget(top: rate0, left: rateT0, asset: "parallax0"),
            ParallaxWidget(top: rate1, left: rateT1, asset: "parallax1"),
            ParallaxWidget(top: rate2, left: rateT2, asset: "parallax2"),
            ParallaxWidget(top: rate3, left: rateT3, asset: "parallax3"),
            ParallaxWidget(top: rate4, left: rateT4, asset: "parallax4"),
            ParallaxWidget(top: rate5, left: rateT5, asset: "parallax5"),
            ParallaxWidget(top: rate6, left: rateT6, asset: "parallax6"),
            ParallaxWidget(top: rate7, left: rateT7, asset: "parallax7"),
            ParallaxWidget(top: rate8, left: rateT8, asset: "parallax8"),

            ListView(
              children: [
                Container(height: 600, color: Colors.transparent,)
              ],
            )
          ],
        ));
  }
  @override
  void initState(){
    super.initState();
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
        rate0 -= (event.y*1.95);
        rateT0 += (event.x*0.95);

        rate1 -= (event.y*2.00);
        rateT1 += (event.x*1.00);

        rate2 -= (event.y*2.10);
        rateT2 += (event.x*1.10);

        rate3 -= (event.y*2.25);
        rateT3 += (event.x*1.25);

        rate4 -= (event.y*2.40);
        rateT4 += (event.x*1.40);

        rate5 -= (event.y*2.5);
        rateT5 += (event.x*1.5);

        rate6 -= (event.y*2.75);
        rateT6 += (event.x*1.75);

        rate7 -= (event.y*3);
        rateT7 += (event.x*2);

        rate8 -= (event.y*3.25);
        rateT8 += (event.x*2.25);
      });
    }));
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    @required this.top,
    @required this.left,
    @required this.asset,

  }) : super(key: key);

  final double top;
  final double left;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 900,
        height: 550,
        child: Image.asset("images/$asset.png",fit: BoxFit.cover,),
      ),
    );
  }
}
