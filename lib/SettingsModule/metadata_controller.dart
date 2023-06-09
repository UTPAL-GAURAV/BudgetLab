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

  int getCurrentBalance(){
    return metadataService.getCurrentBalance();
  }

  int updateCurrentBalance(bool isAddition, int amount) {
    if(isAddition) {
      return metadataService.addToCurrentBalance(amount);
    } else {
      return metadataService.subtractToCurrentBalance(amount);
    }
  }
}
