import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {

  final TextEditingController controller;
  final String label;

   const LabelTextField({Key? key,required this.controller,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
           Expanded(
             child: Text(label,
              style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold),
          ),
           ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all()
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: InputBorder.none
                ),
              ))
        ],
      ),
    );
  }
}
