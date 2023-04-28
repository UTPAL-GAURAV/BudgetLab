import 'package:budgetlab/SettingsModule/metadata_service.dart';

import 'metadata_entity.dart';

class MetaDataController {
  MetadataService metadataService = MetadataService();
  Metadata? getAllMetadata() {
    return metadataService.getAllMetadata();
  }

  updateMetadata() {}
}
