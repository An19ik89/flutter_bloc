import 'dart:async';

enum counterAction{
  Increment,
  Decrement,
  Clear
}

class CounterBloc
{
  int counter;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<counterAction>();
  StreamSink<counterAction> get eventCounterSink => _eventStreamController.sink;
  Stream<counterAction> get eventCounterStream => _eventStreamController.stream;

  CounterBloc()
  {
    counter = 0;
    eventCounterStream.listen((event) {
      if(event == counterAction.Increment){
        counter++;
      }
      else if(event == counterAction.Decrement){
        if(counter != 0){
          counter--;
        }
      }
      else{
        counter = 0;
      }

      counterSink.add(counter);
    });

  }

  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }
}