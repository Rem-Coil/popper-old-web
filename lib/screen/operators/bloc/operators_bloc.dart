import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:popper/data/operator_repository.dart';
import 'package:popper/models/operator.dart';
import 'package:popper/screen/operators/bloc/operators_event.dart';
import 'package:popper/screen/operators/bloc/operators_state.dart';

@singleton
class OperatorsBloc extends Bloc<OperatorsEvent, OperatorsState> {
  final OperatorRepository operatorRepository;

  OperatorsBloc(this.operatorRepository) : super(OperatorsState.initial()) {
    on<ShowOperators>(onShowOperators);
    on<DeleteOperators>(onDeleteOperators);
  }

  Future<void> onShowOperators(
      ShowOperators event, Emitter<OperatorsState> emit) async {
    emit(state.load());
    final operators = await operatorRepository.getOperators();
    final newState = operators.fold(
        (failure) => state.error(failure.message),
        (operators) => state.updateOperator(
            operators..sort((Operator a, Operator b) => a.id - b.id)));
    emit(newState);
  }

  Future<void> onDeleteOperators(
      DeleteOperators event, Emitter<OperatorsState> emit) async {
    emit(state.load());
    final deletingOperator = await operatorRepository.deleteOperator(event.id);
    final newState = deletingOperator.fold(
      (failure) => state.error(failure.message),
      (_) {
        List<Operator> list = List.from(state.listOperators);
        list.removeWhere((element) => element.id == event.id);
        return state.updateOperator(list);
      },
    );
    emit(newState);
  }
}
