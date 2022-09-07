import 'package:shared_data_models/kyc/agent_detail_screen_type.dart';
import 'package:config/Config.dart';

class AgentDetailScreenArguments {
  String title;
  String subTitle;
  AgentDetailScreenType agentDetailScreenType;
  UserType userType;
  bool isProgressBarVisible;
  AgentDetailScreenArguments(this.title, this.subTitle,
      this.agentDetailScreenType, this.userType, this.isProgressBarVisible);
}
