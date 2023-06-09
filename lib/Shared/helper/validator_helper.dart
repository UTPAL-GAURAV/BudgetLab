
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/Shared/constants_manager.dart';

String validateNothing(value) {
  return "";
}

String validateNameField(value) {
  if (value == null || value.isEmpty) {
    return ConstantsManager.NO_TEXT;
  }
  return "";
}

String validateAmountField(value) {
  if (value == null || value.isEmpty) {
    return ConstantsManager.NOT_VALID_AMOUNT;
  }
  try {
    value = int.parse(value);
  } catch (e) {
    return ConstantsManager.NOT_VALID_AMOUNT;
  }
  if (!(value > 0 && value < 99999990)) {
    // Nine Crore...
    return ConstantsManager.NOT_VALID_AMOUNT;
  }
  return "";
}

String validateLendExpenseField(value) {
  MetaDataController metaDataController = MetaDataController();
  String response = validateAmountField(value);
  if(response.isEmpty && (int.parse(value) > metaDataController.getCurrentBalance())) {
    return ConstantsManager.NOT_ENOUGH_BALANCE;
  }
  return response;
}

