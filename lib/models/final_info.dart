import 'package:popper/models/action.dart';
import 'package:popper/models/bobbin_information.dart';
import 'package:popper/models/successful_fields.dart';

class FinalInfo {
  static const noAuthorText = '---';

  final String taskName;
  final successfulFields winding;
  final successfulFields output;
  final successfulFields isolation;
  final successfulFields molding;
  final successfulFields crimping;
  final successfulFields quality;
  final successfulFields testing;

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
      winding: successfulFields(fieldName: noAuthorText, success: true),
      output: successfulFields(fieldName: noAuthorText, success: true),
      isolation: successfulFields(fieldName: noAuthorText, success: true),
      molding: successfulFields(fieldName: noAuthorText, success: true),
      crimping: successfulFields(fieldName: noAuthorText, success: true),
      quality: successfulFields(fieldName: noAuthorText, success: true),
      testing: successfulFields(fieldName: noAuthorText, success: true),
    );
  }

  FinalInfo update(Action action) {
    switch (action.actionType) {
      case 'winding':
        return copyWith(
            winding: successfulFields(
                fieldName: action.author, success: action.successful));
      case 'output':
        return copyWith(
            output: successfulFields(
                fieldName: action.author, success: action.successful));
      case 'isolation':
        return copyWith(
            isolation: successfulFields(
                fieldName: action.author, success: action.successful));
      case 'molding':
        return copyWith(
            molding: successfulFields(
                fieldName: action.author, success: action.successful));
      case 'crimping':
        return copyWith(
            crimping: successfulFields(
                fieldName: action.author, success: action.successful));
      case 'quality':
        return copyWith(
            quality: successfulFields(
                fieldName: action.author, success: action.successful));
      case 'testing':
        return copyWith(
            testing: successfulFields(
                fieldName: action.author, success: action.successful));
      default:
        return this;
    }
  }

  FinalInfo copyWith(
      {successfulFields? winding,
      successfulFields? output,
      successfulFields? isolation,
      successfulFields? molding,
      successfulFields? crimping,
      successfulFields? quality,
      successfulFields? testing}) {
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
