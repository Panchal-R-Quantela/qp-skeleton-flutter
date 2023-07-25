import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';

import '../features/app/presentation/cubits/app_cubit.dart';
import '../features/app/presentation/cubits/app_state.dart';
import '../utils/dimens/dimens.dart';

class QpThemeToggle extends StatelessWidget {
  const QpThemeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(
      buildWhen: (previous, current) {
        return current is AppThemeState;
      },
      builder: (context, state) {
        return SizedBox(
          width: 100,
          child: SwitchListTile.adaptive(
            title: Text(
              "Dark Mode",
              style: TextStyle(fontSize: Dimens.d15.responsive()),
            ),
            tileColor: Theme.of(context).cardColor,
            value: (state as AppThemeState).isDarkTheme,
            onChanged: (isDarkTheme) => context
                .read<AppCubit>()
                .onAppThemeChanged(isDarkMode: isDarkTheme),
          ),
        );
      },
    );
  }
}
