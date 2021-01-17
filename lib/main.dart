import 'package:flutter/cupertino.dart';
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        actions: <Widget> [
          Row(

            children: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  )
              ),
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
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top:50, left: 120),
                child: Row(
                  children: [
                    Text("Fake Tinder App", style: TextStyle(fontSize: 25),),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 50,),
          new Image.asset("assets/images/girl.jpg", scale: 1,),
          SizedBox(height: 30,),
          Text("Bruna, 24", style: TextStyle(fontSize: 18)),
          Text("RJ, Niteroi", style: TextStyle(fontSize: 16)),
          SizedBox(height: 50,),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top:20, left: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    FloatingActionButton(

                      heroTag: null,
                      onPressed: null,
                      tooltip: 'Increment',

                      child: Icon(Icons.cancel),

                    ),
                    SizedBox(width: 40),
                    FloatingActionButton(

                      heroTag: null,
                      onPressed: null,
                      tooltip: 'Increment',

                      child: Icon(Icons.favorite),

                    ),
                  ],
                ),
              ),
            ],
          )
        ],

      ),

      bottomNavigationBar: Row(

        ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
