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

  // Current Balance
  double getCurrentBalance(){
    return metadataRepository.getCurrentBalance();
  }

  int addToCurrentBalance(double amount) {
    return metadataRepository.addToCurrentBalance(amount);
  }

  int subtractToCurrentBalance(double amount) {
    return metadataRepository.subtractToCurrentBalance(amount);
  }

  // Your Worth
  double getYourWorth(){
    return metadataRepository.getYourWorth();
  }

  int addToYourWorth(double amount) {
    return metadataRepository.addToYourWorth(amount);
  }

  int subtractToYourWorth(double amount) {
    return metadataRepository.subtractToYourWorth(amount);
  }
}