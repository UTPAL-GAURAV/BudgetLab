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

  int updateCurrentBalance(bool isAddition, double amount, bool isChangeInWorth) {
      if(isChangeInWorth) {
        updateYourWorth(isAddition, amount);
      }
      // Update Current Balance
      if(isAddition) {
        return addToCurrentBalance(amount);
      }
      return _subtractToCurrentBalance(amount);
  }

  int addToCurrentBalance(double amount) {
    return metadataRepository.addToCurrentBalance(amount);
  }

  int _subtractToCurrentBalance(double amount) {
    return metadataRepository.subtractToCurrentBalance(amount);
  }

  // Your Worth
  double getYourWorth(){
    return metadataRepository.getYourWorth();
  }

  int updateYourWorth(bool isAddition, double amount) {
    if(isAddition) {
      return _addToYourWorth(amount);
    }
    return _subtractToYourWorth(amount);
  }

  int _addToYourWorth(double amount) {
    return metadataRepository.addToYourWorth(amount);
  }

  int _subtractToYourWorth(double amount) {
    return metadataRepository.subtractToYourWorth(amount);
  }

  // Expendable Amount
  double getExpendableAmount(){
    return metadataRepository.getExpendableAmount();
  }

  int updateExpendableAmount(bool isAddition, double amount, bool isChangeInCurrentBalance, bool isChangeInWorth) {
    // If there's no change in Current Balance then there'll be no change in Worth
    if(isChangeInCurrentBalance) {
       updateCurrentBalance(isAddition, amount, isChangeInWorth);
    }
    // Update Expendable Amount
    if(isAddition) {
      return _addToExpendableAmount(amount);
    }
    return _subtractToExpendableAmount(amount);
  }

  int _addToExpendableAmount(double amount) {
    return metadataRepository.addToExpendableAmount(amount);
  }

  int _subtractToExpendableAmount(double amount) {
    return metadataRepository.subtractToExpendableAmount(amount);
  }
}