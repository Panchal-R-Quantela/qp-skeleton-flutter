import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/common_widgets/custom_cardview.dart';
import 'package:qp_skeleton_flutter/common_widgets/text_widgets.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';
import '../cubits/work_flow_cubit.dart';
import '../cubits/work_flow_states.dart';

class RegistrationListPage extends StatelessWidget {
  RegistrationListPage({Key? key}) : super(key: key);

  late WorkFlowCubit _cubit;

  @override
  Widget build(BuildContext context) {
    _cubit = BlocProvider.of<WorkFlowCubit>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("RegistrationList")),
        body: BlocBuilder<WorkFlowCubit, WorkFlowCubitState>(
            builder: (context, state) {
          return _cubit.mapListRegister.isNotEmpty
              ? ListView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: Dimens.d10.responsive()),
                  itemCount: _cubit.mapListRegister.length,
                  itemBuilder: (context, index) {
                    var item = _cubit.mapListRegister[index];
                    return Card(
                        margin: const EdgeInsets.all(Dimens.d10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item["client_value1"] != null)
                                bindRow(
                                    title: "Client Value 1",
                                    value: item["client_value1"]),
                              if (item["client_value2"] != null)
                                bindRow(
                                    title: "Client Value 2",
                                    value: item["client_value2"]),
                              if (item["client_value3"] != null)
                                bindRow(
                                    title: "Client Value 3",
                                    value: item["client_value3"]),
                              if (item["comment"] != null)
                                bindRow(
                                    title: "Comment", value: item["comment"]),
                            ],
                          ),
                        ));
                  },
                )
              : const Center(
                  child: Text("No Records Found"),
                );
        }));
  }

  Widget bindRow({required String title, required String value}) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const HP(size: 5),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
