import 'package:flutter/foundation.dart';

@immutable
class OperatorsEvent {}

class ShowOperators extends OperatorsEvent {}

class DeleteOperators extends OperatorsEvent {
  final int id;

  DeleteOperators({
    required this.id,
  });
}
