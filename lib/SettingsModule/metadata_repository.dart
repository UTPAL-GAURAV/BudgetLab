import 'package:budgetlab/SettingsModule/metadata_entity.dart';

import '../../DB/ObjectBoxManager.dart';
import '../objectbox.g.dart';

class MetadataRepository {
  Metadata? getAllMetadata() {
    return ObjectBoxManager.metadataBox.get(1);
  }

  int updateMetadata(Metadata metadata) {
    return ObjectBoxManager.metadataBox.put(metadata);
  }

  int getCurrentBalance() {
    Metadata? metadata = ObjectBoxManager.metadataBox.get(1);
    return metadata==null? 0: metadata.currentBalance;
  }

  int addToCurrentBalance(int amount) {
    final queryBuilder = ObjectBoxManager.metadataBox.query(Metadata_.id.equals(1));
    final entity = queryBuilder.build().findFirst();

    if(entity!=null) {
      entity.currentBalance += amount;
      return ObjectBoxManager.metadataBox.put(entity);
    }
    return -1;
  }

  int subtractToCurrentBalance(int amount) {
    final queryBuilder = ObjectBoxManager.metadataBox.query(Metadata_.id.equals(1));
    final entity = queryBuilder.build().findFirst();

    if(entity!=null) {
      entity.currentBalance -= amount;
      return ObjectBoxManager.metadataBox.put(entity);
    }
    return -1;
  }
}