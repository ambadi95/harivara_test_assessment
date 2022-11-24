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

int totalBox = 0;
int alphaSelectLength = 0;
int numberSelectLength = 0;
int maxSelectionLength = 0;

String error = '';

List<bool>? _isCheckedNum;
List<bool>? _isCheckedAlpha;

  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenModel>(
        instanceModel: MainScreenModel(),
    onModelReady: (model) async {
      _isCheckedNum = List<bool>.filled(model.number.length, false);
      _isCheckedAlpha = List<bool>.filled(model.alphabets.length, false);
    },
    builder: (context, model, child) => SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.grey,
          height: 90,
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  model.numSelected.clear();
                  model.alphaSelected.clear();
                  _isCheckedAlpha = List<bool>.empty();
                  _isCheckedNum = List<bool>.empty();
                  boxLength.clear();
                  selectionLength.clear();
                  alphaLength.clear();
                  numLength.clear();
                  error = '';
                  setState(() {

                  });
                  _isCheckedNum = List<bool>.filled(model.number.length, false);
                  _isCheckedAlpha = List<bool>.filled(model.alphabets.length, false);
                },
                child: Container(
                    color: Colors.purple,
                    height: 90,
                    width: 100,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Reset all Value to 0', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,

                        ),),
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                  color: error.isNotEmpty ? Colors.red : Colors.green,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text( error.isNotEmpty ? error : 'Success',style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ), ),
                      ),
                    )),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                LabelTextField(controller: boxLength, label: "Total No of Boxes to be displayed on each side",
                  onChanged: (value){
                  if(int.parse(value!) > 11){
                    error = "You cannot enter value more than ${11}";
                    setState(() {

                    });
                  }else{
                    setState(() {
                      error = '';
                      totalBox = int.parse(value!);
                    });
                  }
                },),
                LabelTextField(controller: selectionLength, label: "Max No of Total Selection allowed for selecting on both the sides",
                    onChanged: (value){
                      if(int.parse(value!) > totalBox*2 ){
                        error = "You cannot enter value more than ${totalBox*2} in Max No of Selection";
                        setState(() {

                        });
                      }else{
                        setState(() {
                          maxSelectionLength = int.parse(value);
                          error = '';
                        });
                      }
                }),
                LabelTextField(controller: alphaLength, label: "Max No of Alphabets allowed for selecting",
                    onChanged: (value){
                      if(int.parse(value!) > totalBox){
                        error = "You cannot enter value more than ${totalBox} in Max No of Alphabets";
                        setState(() {

                        });
                      }else{
                        setState(() {
                          maxSelectionLength = int.parse(value);
                          error = '';
                        });
                      }
                }),
                LabelTextField(controller: numLength, label: "Max No of Numbers allowed for selecting",
                    onChanged: (value){
                      if(int.parse(value!) > totalBox){
                        error = "You cannot enter value more than ${totalBox} in Max No of Numbers";
                        setState(() {

                        });
                      }else{
                        setState(() {
                          maxSelectionLength = int.parse(value);
                          error = '';
                        });
                      }
                }),
                const SizedBox(height: 25,),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Expanded(
                       flex: 1,
                       child: ListView.builder(
                         shrinkWrap : true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: boxLength.text.isEmpty || int.parse(boxLength.text) > 11 ? 0 : int.parse(boxLength.text),
                           itemBuilder: (BuildContext contex,index)
                           {
                         return  LabelCheckBox(label: model.alphabets[index],
                           value: _isCheckedAlpha![index],
                           onChange: (value){
                           if(value== false){
                             model.alphaSelectedAlpha(index);
                             _isCheckedAlpha![index] = value!;
                             setState(() {

                             });
                             error = '';
                             return;
                           }
                           if(int.parse(selectionLength.text) != model.alphaSelected.length + model.numSelected.length ){
                           if(model.alphaSelected.length != int.parse(alphaLength.text)) {
                             setState(() {
                               _isCheckedAlpha![index] = value!;
                               model.alphaSelectedAlpha(index);
                             });
                             error = '';
                           }else{
                             setState(() {
                               error = 'Unable to select as Max No of Alphabets reached (${alphaLength.text})';
                             });
                           }
                           }else{
                             setState(() {
                               error = 'Unable to select as Max No of reached (${boxLength.text})';
                             });
                           }

                           },);
                       }),
                     ),
                     Expanded(
                       flex: 1,
                       child: ListView.builder(
                           shrinkWrap : true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: boxLength.text.isEmpty || int.parse(boxLength.text) > 11 ? 0 : int.parse(boxLength.text),
                           itemBuilder: (BuildContext contex,index)
                           {
                             return LabelCheckBox(label: model.number[index],
                               value: _isCheckedNum![index],
                               onChange: (value){
                                 if(value== false){
                                   _isCheckedNum![index] = value!;
                                   model.alphaSelectedNumber(index);
                                   setState(() {

                                   });
                                   error = '';
                                   return;
                                 }
                               if(int.parse(selectionLength.text) != model.alphaSelected.length + model.numSelected.length ){
                               if(model.numSelected.length != int.parse(numLength.text)){
                                 setState(() {
                                   _isCheckedNum![index] = value!;
                                 });
                                 model.alphaSelectedNumber(index);
                                 error = '';
                               }
                               else{
                                 setState(() {
                                   error = 'Unable to select as Max No of Numbers reached (${numLength.text})';
                                 });
                               }
                               }else{
                                 setState(() {
                                   error = 'Unable to select as Max No of Selection reached (${selectionLength.text})';
                                 });
                               }


                             }
                             );
                           }),
                     )
                   ],
                 )
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
