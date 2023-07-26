import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/common_widgets/buttons.dart';
import 'package:qp_skeleton_flutter/common_widgets/text_widgets.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';

import '../../../../routing/base_routes.dart';
import '../../../workflow/presentation/cubits/work_flow_cubit.dart';
import '../../../workflow/presentation/cubits/work_flow_states.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late WorkFlowCubit _workFlowCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _workFlowCubit = BlocProvider.of<WorkFlowCubit>(context);
  }

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
          child: BlocBuilder<WorkFlowCubit, WorkFlowCubitState>(
              builder: (context, state) {
            return SymPadding(
              padding: Dimens.d10.responsive(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: SwitchListTile.adaptive(
                      title: Text(
                        "Client",
                        style: TextStyle(fontSize: Dimens.d15.responsive()),
                      ),
                      tileColor: Theme.of(context).cardColor,
                      value: _workFlowCubit.isClient,
                      onChanged: (val) {
                        _workFlowCubit.updateClient();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: QpRectangularCircleButton(
                      btnText: _workFlowCubit.isClient ? "Create" : "Approve",
                      onTap: () {
                        BlocProvider.of<WorkFlowCubit>(context)
                            .getWorkFlowResponse();
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
