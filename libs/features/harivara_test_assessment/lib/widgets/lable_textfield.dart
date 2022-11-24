import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LabelTextField extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  Function(String?) onChanged;
    LabelTextField({Key? key,required this.controller,required this.label,required this.onChanged}) : super(key: key);

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
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                ),
                onChanged: onChanged,
              ))
        ],
      ),
    );
  }
}
