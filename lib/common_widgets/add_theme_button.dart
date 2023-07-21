import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/app/app_bloc.dart';
import '../features/app/app_state.dart';

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
            title: const Text(
              "Dark Mode",
            ),
            tileColor: Theme.of(context).primaryColor,
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
