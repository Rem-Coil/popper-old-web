import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/data/operator_repository.dart';
import 'package:popper/models/operator.dart';
import 'package:popper/screen/tasks/bloc/operators_event.dart';
import 'package:popper/screen/tasks/bloc/operators_state.dart';

class OperatorsBloc extends Bloc<OperatorsEvent, OperatorsState> {
  final OperatorRepository operatorRepository = OperatorRepository();

  OperatorsBloc() : super(OperatorsState.initial()) {
    on<ShowOperators>(onShowOperators);
    on<DeleteOperators>(onDeleteOperators);
  }

  Future<void> onShowOperators(
      ShowOperators event, Emitter<OperatorsState> emit) async {
    emit(state.load());
    final operators = await operatorRepository.getOperators();
    final newState = operators.fold(
        (failure) => state.error(failure.message),
        (operators) => state
            .create(operators..sort((Operator a, Operator b) => a.id - b.id)));
    emit(newState);
  }

  Future<void> onDeleteOperators(
      DeleteOperators event, Emitter<OperatorsState> emit) async {
    final deletingOperator = await operatorRepository.deleteOperator(event.id);
    final newState = state.deleteOperator(deletingOperator);
    emit(newState);
  }
}
