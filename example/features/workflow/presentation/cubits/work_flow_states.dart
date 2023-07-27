import '../../data/models/workflow_response.dart';

abstract class WorkFlowCubitState {
  const WorkFlowCubitState();
}

class StateInitial extends WorkFlowCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UpdateClientState extends WorkFlowCubitState {}

class NavigateToRouteNameState extends WorkFlowCubitState {
  String routeName;

  NavigateToRouteNameState(this.routeName);
}

class NavigateToModuleDefaultComponentState extends WorkFlowCubitState {
  String routeName;

  NavigateToModuleDefaultComponentState(this.routeName);
}
//class NavigateToRegistrationListState extends WorkFlowCubitState {}
