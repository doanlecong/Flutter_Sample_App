import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCustomHomePage(title :'Random words'),
    );
  }
}
 class MyCustomHomePage extends StatelessWidget {
  final String title;
  MyCustomHomePage({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RamdomWords(),
      ),
    );
  }
 }


 class RamdomWords extends StatefulWidget {
   @override
   _RamdomWordsState createState() => _RamdomWordsState();
 }

 class _RamdomWordsState extends State<RamdomWords> {
   final _suggestions = <WordPair>[];
   final _biggerFont = TextStyle(fontSize: 18.0);
  
   Widget _buildSuggestion() {
     return ListView.builder(
       padding: EdgeInsets.all(16.0),
       itemBuilder: (context, i) {
         if(i.isOdd) return Divider();
         final index = i~/2;

         if(index >= _suggestions.length) {
           _suggestions.addAll(generateWordPairs().take(10));
         }
         return _buildRow(_suggestions[index]);
       },
     );
   }
   Widget _buildRow(WordPair pair) {
     return ListTile(
        title: Text(pair.asPascalCase, style: _biggerFont,),
     );
   }

   @override
   Widget build(BuildContext context) {
     return _buildSuggestion();
   }
 }



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
