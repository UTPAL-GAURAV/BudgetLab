import 'package:budgetlab/SettingsModule/metadata_repository.dart';

import 'metadata_entity.dart';

class MetadataService {
  MetadataRepository metadataRepository = MetadataRepository();
  Metadata? getAllMetadata() {
    metadataRepository.getAllMetadata();
  }

  updateMetadata() {}
}