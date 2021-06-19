import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_testing/counterBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final counterBloc = CounterBloc();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Anik Dev'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: counterBloc.counterStream,
                initialData: 0,
                builder: (context,snapshot)
                {
                  return new Text(
                    'Counter : ${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: (){
                  counterBloc.eventCounterSink.add(counterAction.Increment);
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),

              FloatingActionButton(
                onPressed: (){
                  counterBloc.eventCounterSink.add(counterAction.Decrement);
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),

              FloatingActionButton(
                onPressed: (){
                  counterBloc.eventCounterSink.add(counterAction.Clear);
                },
                tooltip: 'Clear',
                child: Icon(Icons.clear),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
