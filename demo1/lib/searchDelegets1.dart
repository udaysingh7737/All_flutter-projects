import 'package:flutter/material.dart';


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
      [IconButton(icon: Icon(Icons.clear), onPressed: () {
        query ="";
      })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar

    return IconButton(tooltip: "Back",
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation
        ),
        onPressed: () {Navigator.pop(context);

        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result base on the selection
    return Container(height: 70,width: 350,
      child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        child: Center(child: Text(query,style: TextStyle(fontSize: 22,color: Colors.white),)),
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentDishes
        : dishes.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.food_bank_sharp),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold, fontSize: 19),
          children: [TextSpan(
              text:suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.black45)
          )],
        ),),
      ),
      itemCount: suggestionList.length,
    );
    // show when someone searches for Something
    throw UnimplementedError();
  }
}
