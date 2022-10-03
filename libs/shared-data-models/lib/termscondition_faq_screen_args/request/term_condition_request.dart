class TermConditionRequestAgent {
  final String y9AgentId;
  final String consent;

  const TermConditionRequestAgent(this.y9AgentId, this.consent);

  factory TermConditionRequestAgent.fromJson(Map<String, dynamic> json) => TermConditionRequestAgent(
      json['y9AgentId'],
      json['consent'],
  );

  Map<String, dynamic> toJson(TermConditionRequestAgent request) {
    return {
      'y9AgentId': request.y9AgentId,
      'consent': request.consent,
    };
  }
}


class TermConditionRequestCustomer {
  final int customerId;
  final String consent;

  const TermConditionRequestCustomer(this.customerId, this.consent);

  factory TermConditionRequestCustomer.fromJson(Map<String, dynamic> json) => TermConditionRequestCustomer(
      json['customerId'],
      json['consent'],
  );

  Map<String, dynamic> toJson(TermConditionRequestCustomer request) {
    return {
      'customerId': request.customerId,
      'consent': request.consent,
    };
  }
}