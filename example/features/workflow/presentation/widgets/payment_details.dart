import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/common_widgets/buttons.dart';
import 'package:qp_skeleton_flutter/common_widgets/custom_cardview.dart';
import 'package:qp_skeleton_flutter/common_widgets/edit_text_field.dart';
import 'package:qp_skeleton_flutter/common_widgets/text_widgets.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';

import '../../../../routing/route_name.dart';
import '../cubits/work_flow_cubit.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Details")),
      body: SymPadding(
        padding: Dimens.d10.responsive(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCardViewWidget(
                child: Container(
              margin: EdgeInsets.all(Dimens.d20.responsive()),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const QpBodyTextWidget("Fill the Details"),
                    VP(size: Dimens.d20.responsive()),
                    QpSkeletonTextFormField(hintText: "Credit card no"),
                    const VP(size: Dimens.d15),
                    QpSkeletonTextFormField(hintText: "Cvv"),
                    const VP(size: Dimens.d15),
                    QpSkeletonTextFormField(hintText: "Expiry Date"),
                    VP(size: Dimens.d15.responsive()),
                  ],
                ),
              ),
            )),
            const VP(),
            Align(
              alignment: Alignment.bottomCenter,
              child: QpRectangularCircleButton(
                btnText: "Submit",
                onTap: () {
                  BlocProvider.of<WorkFlowCubit>(context)
                      .navigateOnWorkFlow(RouteName.paymentDetails);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
