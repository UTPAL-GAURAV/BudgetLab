
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';

import '../FairShareModule/FairShare_Entities/group_entity.dart';

String getJoinFairShareGroupInviteMessage(Group group) {
  MetaDataController metaDataController = MetaDataController();
  String userUniqueId = metaDataController.getAllMetadata()?.userUniqueId ?? "00000";
  String url = "https://www.budgetlab.com/join/";
  // Extract the first 5 letters
  String firstFiveLetters = userUniqueId.substring(0, 5);
  return "Follow this link to join my BudgetLab group: ${url}${firstFiveLetters}${group.groupUniqueId} ";
}