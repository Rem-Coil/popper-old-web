// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/operator_repository.dart' as _i4;
import '../../data/service/api_provider.dart' as _i3;
import '../../data/task_information_repository.dart' as _i7;
import '../../data/task_repository.dart' as _i8;
import '../../domain/actions_use_case.dart' as _i10;
import '../../screen/operators/bloc/operators_bloc.dart' as _i5;
import '../../screen/task_information/bloc/task_information_bloc.dart' as _i6;
import '../../screen/tasks/bloc/tasks_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ApiProvider>(_i3.ApiProvider());
  gh.singleton<_i4.OperatorRepository>(_i4.OperatorRepository());
  gh.singleton<_i5.OperatorsBloc>(
      _i5.OperatorsBloc(get<_i4.OperatorRepository>()));
  gh.singleton<_i6.TaskInformationBloc>(_i6.TaskInformationBloc());
  gh.singleton<_i7.TaskInformationRepository>(_i7.TaskInformationRepository());
  gh.singleton<_i8.TaskRepository>(_i8.TaskRepository(get<_i3.ApiProvider>()));
  gh.singleton<_i9.TasksBloc>(_i9.TasksBloc(get<_i8.TaskRepository>()));
  gh.singleton<_i10.DeleteDuplicateUseCase>(
      _i10.DeleteDuplicateUseCase(get<_i7.TaskInformationRepository>()));
  return get;
}
