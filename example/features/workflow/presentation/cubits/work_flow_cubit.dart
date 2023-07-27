import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/image_path.dart';
import '../../../../routing/route_name.dart';
import 'work_flow_states.dart';

class WorkFlowCubit extends Cubit<WorkFlowCubitState> {
  WorkFlowCubit() : super(StateInitial());

  bool isClient = true;
  var currentUiComponent = ''; // Route
  var componentKey = ''; //Obj Key
  Map<String, dynamic> jsonMap = {}; //JsonMap
  Map backStackMap = {}; // Managing Routes backstack

  //TODO Remove in Future only for demo
  List<HashMap> mapListRegister = []; //temporary variable to show data in list
  HashMap clientMap = HashMap(); //temporary variable to show data in list
  HashMap operatorMap = HashMap(); //temporary variable to show data in list

  updateClient() {
    isClient = !isClient;
    emit(UpdateClientState());
  }

  clearAllValues() {
    //Clearing all values on registration
    jsonMap = {};
    componentKey = '';
    currentUiComponent = '';
    backStackMap = {};
  }

  getWorkFlowResponse() async {
    clearAllValues();
    String jsonString = '';
    if (isClient) {
      jsonString = await rootBundle.loadString(ImagePath.clientJson);
    } else {
      jsonString = await rootBundle.loadString(ImagePath.operatorJson);
    }
    jsonMap = await json.decode(jsonString);
    componentKey = jsonMap["workflow"]["default_component_mobile"];
    currentUiComponent = getComponent();
    navigationCheck();
  }

  navigationCheck() {
    debugPrint(
        "Current Key :: $componentKey :: Current component :: $currentUiComponent");

    if (currentUiComponent == RouteName.clientDetails ||
        currentUiComponent == RouteName.landDetails ||
        currentUiComponent == RouteName.paymentDetails ||
        currentUiComponent == RouteName.registrationApproval ||
        currentUiComponent == RouteName.dynamicRoute) {
      emit(NavigateToRouteNameState(currentUiComponent));
    } else if (currentUiComponent == RouteName.registrationList) {
      if (clientMap.isNotEmpty && isClient) {
        mapListRegister.add(clientMap);
      }
      if (operatorMap.isNotEmpty && !isClient) {
        mapListRegister.add(operatorMap);
      }
      emit(NavigateToRegistrationListState());
    }

    /*------Adding key with route ui component for managing backstack----- */
    backStackMap[currentUiComponent] = componentKey;
  }

  //TODO on next click events for next route
  navigateOnWorkFlow(String currentRoute) {
    //Checking value in backstack for current page than start navigation from current page
    if (backStackMap[currentRoute] != null) {
      componentKey = backStackMap[currentRoute];
    }
    //Getting Ui Component for next page
    currentUiComponent = getNextComponent();
    navigationCheck();
  }

  //TODO obj.json
  getComponent() {
    var value = '';
    /**
        Getting UI component from component key
        eg : component key : "client_details",  ui_component_mobile : "/clientDetails"
     **/
    if (jsonMap["workflow"][componentKey] != null) {
      value = jsonMap["workflow"][componentKey]["ui_component_mobile"];
      // debugPrint("getComponent :: $value ");
    }
    return value;
  }

  //TODO obj.json
  getNextComponent() {
    var nextUiComponent = '';
    //Check for current componentKey and save the onSuccess value to Component Key
    if (jsonMap["workflow"][componentKey] != null) {
      componentKey = jsonMap["workflow"][componentKey]["onSuccess"];
      // debugPrint("getNextComponentKey :: $componentKey ");
      nextUiComponent = getComponent();
    }
    //If value is empty move to default page eg : registration_list
    if (nextUiComponent == "" && jsonMap["module_default_component"] != null) {
      nextUiComponent = "/${jsonMap["module_default_component"]}";
    }
    return nextUiComponent;
  }

  saveClientDetails({String? value1, String? value2, String? value3}) {
    if (value1 != null) {
      clientMap["client_value1"] = value1;
    }
    if (value2 != null) {
      clientMap["client_value2"] = value2;
    }
    if (value3 != null) {
      clientMap["client_value3"] = value3;
    }
  }

  saveApprovalDetails({String? value}) {
    operatorMap["comment"] = value;
  }
}

/*  "submit_details": {
      "ui_component": "paymentDetails.component",
      "ui_component_mobile": "/dynamicRoute",
      "onSuccess": "module_default_component",
      "onFailure": "0"
    }*/
