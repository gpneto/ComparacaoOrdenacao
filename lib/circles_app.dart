import 'package:aps_sort/home.dart';
import 'package:aps_sort/redux/app_middleware.dart';
import 'package:aps_sort/redux/app_reducer.dart';
import 'package:aps_sort/redux/app_state.dart';
import 'package:aps_sort/routes.dart';
import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import "package:redux/redux.dart";

class CirclesApp extends StatefulWidget {
  const CirclesApp({
    Key key,
  }) : super(key: key);

  @override
  _CirclesAppState createState() => _CirclesAppState();
}

class _CirclesAppState extends State<CirclesApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Circles App",
      navigatorKey: GlobalKey<NavigatorState>(),
      home: HomePageSort(),
    );
  }
}
