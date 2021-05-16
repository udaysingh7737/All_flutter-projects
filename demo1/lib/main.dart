import 'package:flutter/material.dart';

void main() {
  runApp(myapp1());
}

class myapp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "smple app",
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "sample Application",
              style: TextStyle(fontSize: 28.0),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  })
            ],
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
                  highlightColor: Colors.red,
                  onPressed: () {},
                  elevation: 13.0,
                  splashColor: Colors.orange,
                  child: Text(
                    "help! me",
                    textDirection: TextDirection.ltr,
                    softWrap: false,
                    maxLines: 2,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                ),
                Text(
                  "hello! welcome this is uday singh| le Application le Application le Application le Application le Application le Application le Application le Application le Application le Application ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        elevation: 10.0,
                        color: Colors.orange,
                        highlightElevation: 40.0,
                        child: Text(
                          "click me",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                              backgroundColor: Colors.green[200],
                              wordSpacing: 20.0,
                              fontFamily: "Times New Roman",
                              decorationStyle: TextDecorationStyle.dashed),
                          textAlign: TextAlign.left,
                        ),
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "button 11",
                          style:
                              TextStyle(fontSize: 25.0, color: Colors.orange),
                        ),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        elevation: 10.0,
                        color: Colors.orange,
                        highlightElevation: 40.0,
                        child: Text(
                          "click me",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                              backgroundColor: Colors.green[200],
                              wordSpacing: 20.0,
                              fontFamily: "Times New Roman",
                              decorationStyle: TextDecorationStyle.dashed),
                          textAlign: TextAlign.left,
                        ),
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "button 11",
                          style:
                              TextStyle(fontSize: 25.0, color: Colors.orange),
                        ),
                      ),
                    ]),
                TextField(
                  maxLength: 20,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "user name",
                  ),
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 25.0,
                  ),
                ),
                TextField(
                  maxLength: 16,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                )
              ]),
        ));
  }
}

class DataSearch extends SearchDelegate<String> {
  final dishes = [
    "laddu",
    'kheer',
    'halwa',
    'kaju katli',
    'khaand',
    'lassi',
    'shreekhand',
    'panni patase',
    'kachori'
  ];
  final recentDishes = [
    'laddu',
    'shreekhand',
    'lassi',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return
        // Action for app bar
        [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar

    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: null),
        onPressed: () {});
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result base on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentDishes : dishes;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.food_bank_sharp),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
    // show when someone searches for Something
  }
}
