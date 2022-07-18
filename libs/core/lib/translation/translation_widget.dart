import 'package:core/translation/language_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TranslationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<Language>(
        key: Key('language_dropdown'),
        underline: SizedBox(),
        icon: Icon(Icons.language, color: Colors.black),
        onChanged: (Language? language) {
          Get.updateLocale(language!.locale);
          Intl.defaultLocale = language.locale.languageCode;
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(e.name),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
