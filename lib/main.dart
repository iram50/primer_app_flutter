import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange.shade50),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier{
  var current = WordPair.random();

  void getSigieuite(){
    current= WordPair.random();
    notifyListeners();
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Idea Aleatoria"),
          SizedBox(height: 15,),
          BigCard(idea: appState.current),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){
              appState.getSigieuite();
            }, 
            child: Text("Siguiente"))
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget{
  final WordPair idea;
  
  const BigCard({
    super.key,
    required this.idea
  });

  @override
  Widget build(BuildContext context){
    final tema = Theme.of(context);
    final textStyle = tema.textTheme.displayMedium!.copyWith(
      color: tema.colorScheme.onPrimary,
    );

    return Card(
    color: tema.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          idea.asLowerCase, 
          style: textStyle,
          semanticsLabel: "${idea.first} ${idea.second}",
          ),
      ),
    );
  }
}



  