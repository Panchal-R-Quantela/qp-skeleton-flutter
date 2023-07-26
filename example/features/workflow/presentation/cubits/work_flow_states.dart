import '../../data/models/workflow_response.dart';

abstract class WorkFlowCubitState {
  const WorkFlowCubitState();
}

class StateInitial extends WorkFlowCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NavigateToClientDetailsState extends WorkFlowCubitState {}

class NavigateToLandDetailsState extends WorkFlowCubitState {}

class NavigateToPaymentDetailsState extends WorkFlowCubitState {}

class NavigateToApprovalState extends WorkFlowCubitState {}

class NavigateToRegistrationListState extends WorkFlowCubitState {}

class NavigateToDynamicPageState extends WorkFlowCubitState {}
