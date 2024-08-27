import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/environment.dart';

part 'environment_state.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit() : super(EnvironmentState.initial());

// loadEnvironment
  Future<void> loadEnvironment(EnvironmentType type) async {
    emit(state.copyWith(status: EnvironmentStatus.loading));
    try {
      // load environment
      final environment = _loadEnvironment(type);
      emit(state.copyWith(
        status: EnvironmentStatus.success,
        environment: environment,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: EnvironmentStatus.failure,
        message: 'Failed to load environment',
      ));
    }
  }

  Environment _loadEnvironment(EnvironmentType type) {
    return Environment.values[type] ?? Environment.isEmpty;
  }
}
