

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:my_app/calculator.dart';
import 'package:my_app/login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      'login': (context)=>MyLogin(),
      'calculator': (context)=>HomePage()
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {

    return MaterialApp(
        home:Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: Row(
          children: [
            TextButton(child: Text("Listing Activity"),
            onPressed: (){
              Navigator.push(ctx, ListingWidget());
          },
          ),
            TextButton(child: Text("Login"),
              onPressed: (){
                Navigator.pushNamed(ctx, 'login');
              },
            ),
            TextButton(child: Text("Calculator"),
              onPressed: (){
                Navigator.pushNamed(ctx, 'calculator');
              },
            ),

      ]

        )));
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];                 // NEW
  final _biggerFont = const TextStyle(fontSize: 18); // NEW

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }

}
class ListingWidget extends MaterialPageRoute<Null> {
  ListingWidget() : super(builder: (BuildContext ctx){
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(ctx).canvasColor,
        elevation: 1.0,),
      body: const Center(
        child: RandomWords(),
      ),
    ));
  });
}
