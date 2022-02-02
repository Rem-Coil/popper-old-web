import 'package:flutter/foundation.dart';
import 'package:popper/models/operator.dart';

@immutable
class OperatorsState {
  final bool isLoad;
  final String? errorMessage;
  final List<Operator> listOperators;

  OperatorsState._(this.isLoad, this.errorMessage, this.listOperators);

  factory OperatorsState.initial() =>
      OperatorsState._(false, null, List.empty());

  OperatorsState load() => OperatorsState._(true, null, List.from(listOperators));

  OperatorsState error(String errorMessage) =>
      OperatorsState._(false, errorMessage, List.from(listOperators));

  OperatorsState create(List<Operator> list) =>
      OperatorsState._(false, null, list);


  bool get hasError => errorMessage != null;
}
