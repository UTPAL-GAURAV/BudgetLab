import 'package:budgetlab/SettingsModule/metadata_repository.dart';

import 'metadata_entity.dart';

class MetadataService {
  MetadataRepository metadataRepository = MetadataRepository();
  Metadata? getAllMetadata() {
    metadataRepository.getAllMetadata();
  }

  int updateMetadata(Metadata metadata) {
    return metadataRepository.updateMetadata(metadata);
  }

  int getCurrentBalance(){
    return metadataRepository.getCurrentBalance();
  }

  int addToCurrentBalance(int amount) {
    return metadataRepository.addToCurrentBalance(amount);
  }

  int subtractToCurrentBalance(int amount) {
    return metadataRepository.subtractToCurrentBalance(amount);
  }
}