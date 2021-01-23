import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//create the user class
class User {
  final int id;
  final String imgUrl;
  final String name;
  final int age;
  final String localeState;
  final String localeCity;
  final String description;
  final String email;

  User(
      {this.id,
      this.imgUrl,
      this.name,
      this.age,
      this.localeState,
      this.localeCity,
      this.description,
      this.email});

//
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      age: json['age'],
      localeState: json['localeState'],
      localeCity: json['localeCity'],
      description: json['description'],
      email: json['email'],
    );
  }
}

Future<String> getJSONData() async {
  var response = await http.get(
      Uri.encodeFull('https://faketinder-spring-flutter.herokuapp.com/users/1'),
      headers: {"Accept": "application/json"});
  return "error";
}

Future<User> fetchUser() async {
  final response =
      await http.get('https://faketinder-spring-flutter.herokuapp.com/users/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSettings()));
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.blueGrey,
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserMatches()));
                      },
                      icon: Icon(
                        Icons.local_fire_department,
                        color: Colors.blueGrey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserMessages()));
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                )),
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
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  height: 600,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: new Image.asset(
                      "assets/images/girl.jpg",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 400),
                        child: FutureBuilder<User>(
                            future: fetchUser(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    snapshot.data.name.toString() +
                                        "\n" +
                                        snapshot.data.localeState.toString() +
                                        "\n" +
                                        snapshot.data.localeCity.toString(),
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold));
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              // By default, show a loading spinner.
                              return CircularProgressIndicator();
                            })),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 120),
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

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Settings'),
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.only(left: 20, right:20, top: 20, bottom: 20),
            child: ListView(children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<User>(

                    future: fetchUser(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text(
                          "Name: " + snapshot.data.name.toString(),
                        );
                      } else if(snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<User>(

                    future: fetchUser(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text(
                          "Age: " + snapshot.data.age.toString(),
                        );
                      } else if(snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<User>(

                    future: fetchUser(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text(
                          "Description: " + snapshot.data.description.toString(),
                        );
                      } else if(snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<User>(

                    future: fetchUser(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text(
                          "State: " + snapshot.data.localeState.toString(),
                        );
                      } else if(snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<User>(

                    future: fetchUser(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text(
                          "City: " + snapshot.data.localeCity.toString(),
                        );
                      } else if(snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<User>(

                    future: fetchUser(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text(
                          "Email: " + snapshot.data.email.toString(),
                        );
                      } else if(snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  Navigator.pop(context);
            },
          )
        ])
        ),
      ),
    );
  }
}

class UserMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class UserMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
