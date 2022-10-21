
import 'package:config/Colors.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../../state/referral_program_state.dart';
import '../../viewmodel/referral_program_coordinator.dart';


class ApplyFilter extends StatefulWidget {
  ApplyFilter({Key? key}) : super(key: key);

  @override
  State<ApplyFilter> createState() => _ApplyFilterState();
}

class _ApplyFilterState extends State<ApplyFilter> {
  int selectedFilter = 0;
  var languageCode = '';

  @override
  Widget build(BuildContext context) =>
      BaseView<ReferralProgramCoordinator, ReferralProgramState>(
        setupViewModel: (coordinator) async {
          await coordinator.getSelectedFilter();
        },
        onStateListenCallback: (preState, newState) {
          selectedFilter = newState.selectedFilterIndex;
        },

        builder: (context, state, welcomeCoordinator) =>
            _buildMainUi(state, welcomeCoordinator),
      );

  Widget _buildMainUi(
      ReferralProgramState state, ReferralProgramCoordinator coordinator) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCheckBoxWidget(['PRS_filter_all', 'PRS_waiting','PRS_filter_onboarded'], state, coordinator),
        ],
      ),
    );
  }

  Widget _buildCheckBoxWidget(List<String> label, ReferralProgramState state,
      ReferralProgramCoordinator coordinator) {
    return ListView.builder(
      itemCount: label.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
            coordinator.selectFilter(index);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Expanded(child: Text(label[index].tr)),
                    index == selectedFilter
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
