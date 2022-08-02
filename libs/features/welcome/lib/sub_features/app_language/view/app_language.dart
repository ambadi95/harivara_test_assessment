import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import '../../welcome/state/welcome_screen_state.dart';
import '../../welcome/viewmodel/welcome_coordinatior.dart';
import 'package:get/get.dart';

class AppLanguage extends StatefulWidget {
  const AppLanguage({Key? key}) : super(key: key);

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {
  bool selectedEng = true;
  bool selectedSw = false;

  String selectedLang = 'EN';

  @override
  Widget build(BuildContext context) =>
      BaseView<WelcomeCoordinator, WelcomeScreenState>(
        setupViewModel: (coordinator) async {},
        builder: (context, state, welcomeCoordinator) => _buildMainUi(),
      );

  Widget _buildMainUi() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCheckedWidget('English', () => {}, selectedEng),
          _buildCheckedWidget('Swahili', () => {}, selectedSw)
        ],
      ),
    );
  }

  Widget _buildCheckedWidget(String label, Function() onTap, bool isSelected) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text(label)),
                  isSelected
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.red,
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
