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

  int updateCurrentBalance(bool isAddition, double amount, bool isChangeInWorth) {
    if(isAddition) {
      if(isChangeInWorth) {
        metadataService.addToYourWorth(amount);
      }
      return metadataService.addToCurrentBalance(amount);
    } else {
      if(isChangeInWorth) {
        metadataService.subtractToYourWorth(amount);
      }
      return metadataService.subtractToCurrentBalance(amount);
    }
  }
}
