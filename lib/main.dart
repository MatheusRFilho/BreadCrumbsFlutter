import 'package:breadcrumbs/breadcrumb_item.dart';
import 'package:flutter/material.dart';

import 'breadcrumb.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        NextPage.route: (context) => NextPage(),
        NextPage2.route: (context) => NextPage2(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static const String route = '/';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breadcrum'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, NextPage.route);
                  breadcrumbs.add(BreadcrumbItem(
                    text: NextPage.route,
                    icon: Icons.access_alarm_outlined,
                  ));
                },
                child: Text('Next Page'),
              ),
            ),
          ),
          Breadcrumb(),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  static const String route = '/nextPage';
  NextPage({Key? key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breadcrum'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, NextPage2.route);
                      breadcrumbs.add(BreadcrumbItem(text: NextPage2.route));
                    },
                    child: Text('Next Page'),
                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      breadcrumbs.removeLast();
                    },
                    child: Text('Prev Page'),
                  ),
                ],
              ),
            ),
          ),
          Breadcrumb(),
        ],
      ),
    );
  }
}

class NextPage2 extends StatefulWidget {
  static const String route = '/test';
  NextPage2({Key? key}) : super(key: key);

  @override
  _NextPage2State createState() => _NextPage2State();
}

class _NextPage2State extends State<NextPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breadcrum'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                  breadcrumbs.removeLast();
                },
                child: Text('Back'),
              ),
            ),
          ),
          Breadcrumb(),
        ],
      ),
    );
  }
}
