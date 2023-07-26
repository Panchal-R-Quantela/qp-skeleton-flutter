import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/common_strings.dart';
import '../../../../constants/image_path.dart';
import '../../../../routing/route_name.dart';
import 'work_flow_states.dart';

class WorkFlowCubit extends Cubit<WorkFlowCubitState> {
  WorkFlowCubit() : super(StateInitial());

  var currentUiComponent = ''; // Route
  var componentKey = ''; //Obj Key

  late bool isClient;
  Map<String, dynamic> dataMap = {}; //JsonMap

  getWorkFlowResponse() async {
    dataMap = {};
    componentKey = '';
    currentUiComponent = '';

    isClient = true;
    String jsonString = '';
    if (isClient) {
      jsonString = await rootBundle.loadString(ImagePath.clientJson);
    } else {
      jsonString = await rootBundle.loadString(ImagePath.operatorJson);
    }
    dataMap = await json.decode(jsonString);
    componentKey = dataMap["workflow"]["default_component_mobile"];
    currentUiComponent = getComponent();
    navigationCheck();
  }

  navigationCheck() {
    debugPrint(
        "Current Key :: $componentKey :: Current component :: $currentUiComponent");
    if (currentUiComponent == RouteName.clientDetails) {
      emit(NavigateToClientDetailsState());
    } else if (currentUiComponent == RouteName.landDetails) {
      emit(NavigateToLandDetailsState());
    } else if (currentUiComponent == RouteName.paymentDetails) {
      emit(NavigateToPaymentDetailsState());
    } else if (currentUiComponent == RouteName.registrationApproval) {
      emit(NavigateToApprovalState());
    } else if (currentUiComponent == RouteName.registrationList) {
      emit(NavigateToRegistrationListState());
    } else if (currentUiComponent == RouteName.dynamicRoute) {
      emit(NavigateToDynamicPageState());
    }
  }

  //TODO obj.json
  navigateOnWorkFlow() {
    //Getting Ui Component for next page
    currentUiComponent = getNextComponent();
    navigationCheck();
  }

  //TODO obj.json
  getComponent() {
    var value = '';
    //Getting ui component
    if (dataMap["workflow"][componentKey] != null) {
      value = dataMap["workflow"][componentKey]["ui_component_mobile"];
      // debugPrint("getComponent :: $value ");
    }
    return value;
  }

  //TODO obj.json
  getNextComponent() {
    var nextUiComponent = '';
    //Check for current componentKey and save the onSuccess value to Component Key
    if (dataMap["workflow"][componentKey] != null) {
      componentKey = dataMap["workflow"][componentKey]["onSuccess"];
      // debugPrint("getNextComponentKey :: $componentKey ");
      nextUiComponent = getComponent();
    }
    if (nextUiComponent == "" && dataMap["module_default_component"] != null) {
      nextUiComponent = "/${dataMap["module_default_component"]}";
    }
    return nextUiComponent;
  }
}
