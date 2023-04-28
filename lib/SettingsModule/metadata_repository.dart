import 'package:budgetlab/SettingsModule/metadata_entity.dart';

import '../../DB/ObjectBoxManager.dart';

class MetadataRepository {
  Metadata? getAllMetadata() {
    return ObjectBoxManager.metadataBox.get(1);
  }

  int updateMetadata(Metadata metadata) {
    return ObjectBoxManager.metadataBox.put(metadata);
  }
}