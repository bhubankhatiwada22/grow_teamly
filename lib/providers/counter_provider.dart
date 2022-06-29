import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier{
  int count=0;
increaseCounter(){
  count++;
  notifyListeners();

}
decreaseCounter(){
  count--;
  notifyListeners();
  
}
}
