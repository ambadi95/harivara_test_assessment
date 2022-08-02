import 'package:shared_data_models/kyc/agent_detail_screen_type.dart';

class AgentDetailScreenArguments{
  String title;
  String subTitle;
  AgentDetailScreenType agentDetailScreenType;
  String userType;
  bool isProgressBarVisible;
  AgentDetailScreenArguments(
      this.title,
      this.subTitle,
      this.agentDetailScreenType,
      this.userType,
      this.isProgressBarVisible
      );
}