
import 'dart:math';

import 'package:budgetlab/Shared/external_api_service.dart';

import '../enums_manager.dart';

class AvatarService {

  Future<String> getGenderAvatarFromName(String name) async {
    ExternalApiService externalApiService = ExternalApiService();

    Gender gender = await externalApiService.getGenderFromName(name);
    if(gender == Gender.male) {
      return getRandomMaleAvatar();
    } else if(gender == Gender.female) {
      return getRandomFemaleAvatar();
    } else {
      return getNeutralGenderAvatar();
    }
  }

  String getRandomMaleAvatar() {
    Random random = Random();
    int number = random.nextInt(2);
    return number == 0 ? getMaleBlackHairAvatar() : getMaleBrownHairAvatar();
  }

  String getRandomFemaleAvatar() {
    Random random = Random();
    int number = random.nextInt(2);
    return number == 0 ? getFemaleBlackHairAvatar() : getFemalePinkHairAvatar();
  }

  /// List of all Avatars

  String getFemaleBlackHairAvatar() {
    return "assets/images/avatars/femaleBlackHair.jpg";
  }

  String getFemalePinkHairAvatar() {
    return "assets/images/avatars/femalePinkHair.jpg";
  }

  String getMaleBlackHairAvatar() {
    return "assets/images/avatars/maleBlackHair.jpg";
  }

  String getMaleBrownHairAvatar() {
    return "assets/images/avatars/maleBrownHair.jpg";
  }

  String getNeutralGenderAvatar() {
    return "assets/images/avatars/neutralGreenHair.jpg";
  }
}