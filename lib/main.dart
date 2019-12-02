import 'package:aps_sort/circles_app.dart';
import 'package:aps_sort/redux/app_middleware.dart';
import 'package:aps_sort/redux/app_reducer.dart';
import 'package:aps_sort/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:math';

import 'algoritimos.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = [];

  int initPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Store<AppState> store = Store<AppState>(appReducer,
        initialState: AppState.init(), middleware: createStoreMiddleware());

    data.add(StoreProvider(
        store: store,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: GlobalKey<NavigatorState>(),
            title: "Circles App",
            home: HomePageSort())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomTabView(
        initPosition: initPosition,
        itemCount: data.length,
        tabBuilder: (context, index) => Tab(text: "SORT ${index + 1}"),
        pageBuilder: (context, index) {
          return data[index];
        },
        onPositionChange: (index) {
          print('current position: $index');
          initPosition = index;
        },
        onScroll: (position) => print('$position'),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Store<AppState> store = Store<AppState>(appReducer,
                initialState: AppState.init(),
                middleware: createStoreMiddleware());

            data.add(StoreProvider(
                store: store,
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: GlobalKey<NavigatorState>(),
                    title: "Circles App",
                    home: HomePageSort())));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/// Implementation

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int initPosition;

  CustomTabView({
    @required this.itemCount,
    @required this.tabBuilder,
    @required this.pageBuilder,
    this.stub,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView>
    with TickerProviderStateMixin {
  TabController controller;
  int _currentCount;
  int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 : _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation.addListener(onScroll);
      });
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();


    return   Stack(
      children: <Widget>[


        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
                  (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
        Container(
            height: 90,
            decoration: ShapeDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff5fe164), Color(0xff39873c)]),
                shape: CustomShapeBorder(),
                shadows: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.0,
// has the effect of softening the shadow
                    spreadRadius: 4.0,
// has the effect of extending the shadow
                    offset: Offset(
                      .0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ])),
        Container(
          alignment: Alignment.topCenter,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelColor: Colors.white,
            unselectedLabelColor: Theme.of(context).hintColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
                  (index) => widget.tabBuilder(context, index),
            ),
          ),
        )
      ],
    );

  }

  onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll(controller.animation.value);
    }
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = Path();

    path.lineTo(0.0, rect.height + 40);

    var firstControlPoint =
        Offset(rect.width / 4, rect.height); //Primeiro ponto de controle
    var firstEndPoint =
        Offset(rect.width / 2, rect.height + 20); //endPonit na reta
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(rect.width + 60, rect.height + 60); //Segundo ponto de controle
    var secondEndPoint = Offset(rect.width, 0); //endPonit na reta
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.close();
    return path;
  }
}
