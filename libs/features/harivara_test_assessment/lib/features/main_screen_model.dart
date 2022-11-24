

import 'package:flutter/cupertino.dart';

class MainScreenModel extends ChangeNotifier {


  List alphabets = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m"
  ];

  List number = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13"
  ];

  List alphaSelected = [];

  void alphaSelectedAlpha(int index){
    if(alphaSelected.contains(index)){
      alphaSelected.remove(index);
    }else{
      alphaSelected.add(index);
    }
  }

  List numSelected = [];

  void alphaSelectedNumber(int index){
    if(numSelected.contains(index)){
      numSelected.remove(index);
    }else{
      numSelected.add(index);
    }
  }



}