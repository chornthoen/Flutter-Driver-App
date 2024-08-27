import 'package:driver_flutter/data/model/environment.dart';
import 'package:driver_flutter/features/environment/cubit/environment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderOverlayWidget extends StatelessWidget {
  const LoaderOverlayWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayHeight: 100,
      overlayColor: Colors.black,
      child: BlocSelector<EnvironmentCubit, EnvironmentState, EnvironmentState>(
        selector: (state) {
          return state;
        },
        builder: (context, state) {
          if (state.environment.type == EnvironmentType.production ||
              state.environment.type == EnvironmentType.none) {
            return child;
          }

          final color = state.environment.envColor;
          return Banner(
            message: state.environment.name,
            location: BannerLocation.topEnd,
            color: color,
            child: child,
          );
        },
      ),
    );
  }
}
