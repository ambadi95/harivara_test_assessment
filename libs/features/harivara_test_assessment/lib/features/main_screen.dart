import 'package:flutter/material.dart';

import '../utils/base_view.dart';
import '../widgets/label_checkbox.dart';
import '../widgets/lable_textfield.dart';
import 'main_screen_model.dart';

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
    return BaseView<MainScreenModel>(
        instanceModel: MainScreenModel(),
    onModelReady: (model) async {},
    builder: (context, model, child) => SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LabelTextField(controller: boxLength, label: "Total No of Boxes to be displayed on each side",),
              LabelTextField(controller: selectionLength, label: "Max No of Total Selection allowed for selecting on both the sides",),
              LabelTextField(controller: alphaLength, label: "Max No of Alphabets allowed for selecting",),
              LabelTextField(controller: numLength, label: "Max No of Numbers allowed for selecting",),
              const SizedBox(height: 25,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Expanded(
                     flex: 1,
                     child: Column(
                       children: [
                         LabelCheckBox(label: "1",
                           value: false,
                           onChange: (value){
                           print(value);
                         },)
                       ],
                     ),
                   ),
                   Expanded(
                     flex: 1,
                     child: Column(
                       children: [
                         LabelCheckBox(label: "a",
                           value: true,
                           onChange: (value){
                             print(value);
                         },)
                       ],
                     ),
                   )
                 ],
               )
            ],
          ),
        ),
      ),
    )
    );
  }
}
