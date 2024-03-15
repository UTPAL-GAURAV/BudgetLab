class FairShareGroupMetadata {
  late String groupName;
  late bool isGroup;
  late String icon;

  FairShareGroupMetadata({required this.groupName, required this.isGroup, required this.icon});

  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'isGroup': isGroup,
      'icon': icon,
    };
  }
}
