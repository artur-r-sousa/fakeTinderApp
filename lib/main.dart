import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white60,
        title: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                      Icons.settings,
                      color: Colors.blueGrey,
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.local_fire_department,
                        color: Colors.blueGrey,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 120),
                child: Row(
                  children: [
                    Text(
                      "Fake Tinder App",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              )
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                height: 630,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: new Image.asset(
                    "assets/images/girl.jpg",
                    scale: 1,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 500),
                    child: Text(
                      "UserName, Age \nState, city",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: null,
                      tooltip: 'Increment',
                      child: Icon(
                        Icons.cancel,
                        size: 50,
                      ),
                    ),
                    SizedBox(width: 40),
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: null,
                      tooltip: 'Increment',
                      child: Icon(
                        Icons.favorite,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),

      bottomNavigationBar: Row(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
