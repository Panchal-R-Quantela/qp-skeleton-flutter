import '../../../../constants/common_strings.dart';


class WorkFlowResponse {
  String? moduleName;
  String? moduleDefaultComponent;
  Workflow? workflow;

  WorkFlowResponse({this.moduleName, this.moduleDefaultComponent, this.workflow});

  WorkFlowResponse.fromJson(Map<String, dynamic> json) {
    moduleName = json['moduleName'];
    moduleDefaultComponent = json["module_default_component"];
    workflow =
        json['workflow'] != null ? Workflow.fromJson(json['workflow']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moduleName'] = moduleName;
    data['module_default_component'] = moduleDefaultComponent;
    if (workflow != null) {
      data['workflow'] = workflow!.toJson();
    }
    return data;
  }
}

class Workflow {
  String? defaultComponent;
  ClientDetails? clientDetails;
  ClientDetails? landDetails;
  ClientDetails? paymentDetails;
  ClientDetails? registrationApproval;

  Workflow(
      {this.defaultComponent,
      this.clientDetails,
      this.landDetails,
      this.paymentDetails});

  Workflow.fromJson(Map<String, dynamic> json) {
    defaultComponent = json['default_component_mobile'];
    clientDetails = json['client_details'] != null
        ? ClientDetails.fromJson(json['client_details'])
        : null;
    landDetails = json['land_details'] != null
        ? ClientDetails.fromJson(json['land_details'])
        : null;
    paymentDetails = json['payment_details'] != null
        ? ClientDetails.fromJson(json['payment_details'])
        : null;
    registrationApproval = json['registration_Approval'] != null
        ? ClientDetails.fromJson(json['registration_Approval'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default_component'] = defaultComponent;
    if (clientDetails != null) {
      data["client_details"] = clientDetails!.toJson();
    }
    if (landDetails != null) {
      data["land_details"] = landDetails!.toJson();
    }
    if (paymentDetails != null) {
      data["payment_details"] = paymentDetails!.toJson();
    }
    if (registrationApproval != null) {
      data["registration_Approval"] = registrationApproval!.toJson();
    }
    return data;
  }
}

class ClientDetails {
  String? uiComponent;
  String? onSuccess;
  String? onFailure;

  ClientDetails({this.uiComponent, this.onSuccess, this.onFailure});

  ClientDetails.fromJson(Map<String, dynamic> json) {
    uiComponent = json['ui_component'];
    onSuccess = json['onSuccess'];
    onFailure = json['onFailure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ui_component'] = uiComponent;
    data['onSuccess'] = onSuccess;
    data['onFailure'] = onFailure;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return onSuccess.toString();
  }
}
