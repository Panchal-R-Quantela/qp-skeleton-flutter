import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/common_widgets/buttons.dart';

import '../../../../routing/base_routes.dart';
import '../../../workflow/presentation/cubits/work_flow_cubit.dart';
import '../../../workflow/presentation/cubits/work_flow_states.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Registration")),
        body: BlocListener<WorkFlowCubit, WorkFlowCubitState>(
          listener: (context, state) {
            if (state is NavigateToClientDetailsState) {
              BaseRoutes.navigateToClientDetails();
            } else if (state is NavigateToLandDetailsState) {
              BaseRoutes.navigateToLandDetails();
            } else if (state is NavigateToPaymentDetailsState) {
              BaseRoutes.navigateToPaymentDetails();
            } else if (state is NavigateToRegistrationListState) {
              BaseRoutes.navigateToRegistrationList();
            } else if (state is NavigateToApprovalState) {
              BaseRoutes.navigateToRegApproval();
            } else if (state is NavigateToDynamicPageState) {
              BaseRoutes.navigateToDynamicRoute();
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: QpRectangularCircleButton(
                btnText: "Start workflow",
                onTap: () {
                  BlocProvider.of<WorkFlowCubit>(context).getWorkFlowResponse();
                },
              ),
            ),
          ),
        ));
  }
}
