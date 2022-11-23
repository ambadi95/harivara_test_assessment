import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
TextEditingController boxLength = TextEditingController();
TextEditingController selectionLength = TextEditingController();
TextEditingController alphaLength = TextEditingController();
TextEditingController numLength = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                 const Text("Total No of Boxes to be displayed on each side",
                    style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                      child: TextField(
                        controller: boxLength,
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                 const SizedBox(
                   width: 320,
                   child: Text("Max No of Total Selection allowed for selecting on both the sides",
                     style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
                   ),
                 ),
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all()
                      ),
                      child: TextField(
                        controller: selectionLength,
                        decoration: const InputDecoration(
                            border: InputBorder.none
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  const Text("Max No of Alphabets allowed for selecting",
                    style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all()
                      ),
                      child: TextField(
                        controller: alphaLength,
                        decoration: const InputDecoration(
                            border: InputBorder.none
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  const Text("Max No of Numbers allowed for selecting",
                    style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all()
                      ),
                      child: TextField(
                        controller: numLength,
                        decoration: const InputDecoration(
                            border: InputBorder.none
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
