import 'package:budgetlab/SettingsModule/metadata_service.dart';

import 'metadata_entity.dart';

class MetaDataController {
  MetadataService metadataService = MetadataService();
  Metadata? getAllMetadata() {
    return metadataService.getAllMetadata();
  }

  int updateMetadata(Metadata metadata) {
    return metadataService.updateMetadata(metadata);
  }

  double getCurrentBalance(){
    return metadataService.getCurrentBalance();
  }

  double getYourWorth(){
    return metadataService.getYourWorth();
  }

  // int updateCurrentBalance(bool isAddition, double amount, bool isChangeInWorth) {
  //   return metadataService.updateCurrentBalance(isAddition, amount, isChangeInWorth);
  // }

  double getExpendableAmount(){
    return metadataService.getExpendableAmount();
  }

  int updateExpendableAmount(bool isAddition, double amount, bool isChangeInCurrentBalance, bool isChangeInWorth) {
    return metadataService.updateExpendableAmount(isAddition, amount, isChangeInCurrentBalance, isChangeInWorth);
  }
}
