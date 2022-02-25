import 'package:popper/models/action.dart';
import 'package:popper/models/bobbin_information.dart';
import 'package:popper/models/successful_field.dart';

class FinalInfo {
  final String taskName;
  final SuccessfulField winding;
  final SuccessfulField output;
  final SuccessfulField isolation;
  final SuccessfulField molding;
  final SuccessfulField crimping;
  final SuccessfulField quality;
  final SuccessfulField testing;

  FinalInfo({
    required this.taskName,
    required this.winding,
    required this.output,
    required this.isolation,
    required this.molding,
    required this.crimping,
    required this.quality,
    required this.testing,
  });

  factory FinalInfo.empty(BobbinInformation bobbin) {
    return FinalInfo(
      taskName: bobbin.bobbinNumber,
      winding: SuccessfulField.initial(),
      output: SuccessfulField.initial(),
      isolation: SuccessfulField.initial(),
      molding: SuccessfulField.initial(),
      crimping: SuccessfulField.initial(),
      quality: SuccessfulField.initial(),
      testing: SuccessfulField.initial(),
    );
  }

  FinalInfo update(Action action) {
    switch (action.actionType) {
      case 'winding':
        return copyWith(
            winding: SuccessfulField(
                fieldName: action.author, success: action.successful));
      case 'output':
        return copyWith(
            output: SuccessfulField(
                fieldName: action.author, success: action.successful));
      case 'isolation':
        return copyWith(
            isolation: SuccessfulField(
                fieldName: action.author, success: action.successful));
      case 'molding':
        return copyWith(
            molding: SuccessfulField(
                fieldName: action.author, success: action.successful));
      case 'crimping':
        return copyWith(
            crimping: SuccessfulField(
                fieldName: action.author, success: action.successful));
      case 'quality':
        return copyWith(
            quality: SuccessfulField(
                fieldName: action.author, success: action.successful));
      case 'testing':
        return copyWith(
            testing: SuccessfulField(
                fieldName: action.author, success: action.successful));
      default:
        return this;
    }
  }

  FinalInfo copyWith(
      {SuccessfulField? winding,
      SuccessfulField? output,
      SuccessfulField? isolation,
      SuccessfulField? molding,
      SuccessfulField? crimping,
      SuccessfulField? quality,
      SuccessfulField? testing}) {
    return FinalInfo(
      taskName: taskName,
      winding: winding ?? this.winding,
      output: output ?? this.output,
      isolation: isolation ?? this.isolation,
      molding: molding ?? this.molding,
      crimping: crimping ?? this.crimping,
      quality: quality ?? this.quality,
      testing: testing ?? this.testing,
    );
  }
}
