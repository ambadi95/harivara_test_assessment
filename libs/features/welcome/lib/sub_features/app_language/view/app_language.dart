import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import '../../welcome/state/welcome_screen_state.dart';
import '../../welcome/viewmodel/welcome_coordinatior.dart';

class AppLanguage extends StatefulWidget {
  UserType userType;
   AppLanguage({Key? key, required this.userType}) : super(key: key);

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {
  int selectedLanguage = 0;
  var languageCode = '';

  @override
  Widget build(BuildContext context) =>
      BaseView<WelcomeCoordinator, WelcomeScreenState>(
        setupViewModel: (coordinator) async {
          await coordinator.getCurrentLocale();
        },
        onStateListenCallback: (preState, newState) {
          languageCode = newState.currentLanguageCode;
          if (languageCode == 'en') {
            selectedLanguage = 0;
          } else {
            selectedLanguage = 1;
          }
        },

        builder: (context, state, welcomeCoordinator) =>
            _buildMainUi(state, welcomeCoordinator),
      );

  Widget _buildMainUi(
      WelcomeScreenState state, WelcomeCoordinator coordinator) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCheckBoxWidget(['English', 'Swahili'], state, coordinator)
        ],
      ),
    );
  }

  Widget _buildCheckBoxWidget(List<String> label, WelcomeScreenState state,
      WelcomeCoordinator welcomeCoordinator) {
    return ListView.builder(
      itemCount: label.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          // if (state.currentLanguageCode == 'en') {
          //   selectedLanguage = 1;
          //   languageCode = 'sw';
          // } else {
          //   selectedLanguage = 0;
          //   languageCode = 'en';
          // }
          if (index == 1 && state.currentLanguageCode == 'en') {
            selectedLanguage = 1;
            languageCode = 'sw';
          } else if(index == 0 && state.currentLanguageCode == 'sw') {
            selectedLanguage = 0;
            languageCode = 'en';
          }
          welcomeCoordinator.setCurrentLocale(languageCode, widget.userType);
          print("Current App language is ===> $languageCode");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(child: Text(label[index])),
                    index == selectedLanguage
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.red,
                            size: 25,
                          )
                        : const SizedBox(
                            height: 25,
                          )
                  ],
                ),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
