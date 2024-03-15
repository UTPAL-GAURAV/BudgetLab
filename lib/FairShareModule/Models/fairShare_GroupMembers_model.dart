
class FairShareGroupMembers {
  // user1 { user2: 10, user3: 0, ...}
  late Map<String, Map<String, int>> membersMap;

  FairShareGroupMembers({
    required this.membersMap,
  });

  Map<String, Map<String, int>> toJson() {
    return membersMap;
  }
}
