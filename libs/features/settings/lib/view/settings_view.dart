import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:settings/view_model/settings_coordinator.dart';

import '../state/settings_state.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) =>
      BaseView<SettingsCoordinator, SettingsState>(
        setupViewModel: (coordinator) async {
        },
        builder: (context, state, coordinator) => Scaffold(
          body: _buildMainUI(context,coordinator, state),
        ),
      );

  Widget _buildMainUI(BuildContext context, SettingsCoordinator coordinator, SettingsState state){
    return Container();
  }
}
