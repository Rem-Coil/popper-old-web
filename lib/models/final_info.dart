import 'package:popper/models/action.dart';
import 'package:popper/models/bobbin_information.dart';

class FinalInfo {
  static const noAuthorText = '---';

  final String taskName;
  final String winding;
  final String output;
  final String isolation;
  final String molding;
  final String crimping;
  final String quality;
  final String testing;

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
      winding: noAuthorText,
      output: noAuthorText,
      isolation: noAuthorText,
      molding: noAuthorText,
      crimping: noAuthorText,
      quality: noAuthorText,
      testing: noAuthorText,
    );
  }

  FinalInfo update(Action action) {
    switch (action.actionType) {
      case 'winding':
        return copyWith(winding: action.author);
      case 'output':
        return copyWith(output: action.author);
      case 'isolation':
        return copyWith(isolation: action.author);
      case 'molding':
        return copyWith(molding: action.author);
      case 'crimping':
        return copyWith(crimping: action.author);
      case 'quality':
        return copyWith(quality: action.author);
      case 'testing':
        return copyWith(testing: action.author);
      default:
        return this;
    }
  }

  FinalInfo copyWith(
      {String? winding,
      String? output,
      String? isolation,
      String? molding,
      String? crimping,
      String? quality,
      String? testing}) {
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
