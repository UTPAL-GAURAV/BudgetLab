
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_members_entity.dart';
import 'package:budgetlab/objectbox.g.dart';

import '../DB/ObjectBoxManager.dart';
import 'FairShare_Entities/friends_entity.dart';
import 'FairShare_Entities/group_entity.dart';
import 'FairShare_Entities/split_transaction_entity.dart';
import 'FairShare_Entities/transactions_entity.dart';

class FairShareRepository {
  List<Group> getAllGroupList() {
    return ObjectBoxManager.groupBox.getAll();
  }

  int addNewGroup(Group group) {
    return ObjectBoxManager.groupBox.put(group);
  }

  Future<bool> deleteGroup(int groupId) {
    return ObjectBoxManager.groupBox.removeAsync(groupId);
  }

  List<Transactions> getAllGroupTransactions(String groupId) {
    final queryBuilder = ObjectBoxManager.transactionsBox.query(Transactions_.groupId.equals(groupId));
    return queryBuilder.build().find();
  }

  int addNewGroupTransaction(Transactions transaction) {
    return ObjectBoxManager.transactionsBox.put(transaction);
  }

  List<SplitTransaction> getSplitTransactions(int transactionId) {
    return ObjectBoxManager.splitTransactionBox.getAll();
  }

  int addNewSplitTransaction(SplitTransaction splitTransaction) {
    return ObjectBoxManager.splitTransactionBox.put(splitTransaction);
  }

  List<GroupMembers> getAllGroupMemberList(int groupId) {
    final queryBuilder = ObjectBoxManager.groupMembersBox.query(GroupMembers_.id.equals(groupId));
    return queryBuilder.build().find();
  }

  List<int> addNewGroupMember(List<GroupMembers> groupMembers) {
    return ObjectBoxManager.groupMembersBox.putMany(groupMembers);
  }

  Future<bool> deleteGroupMember(int id) {
    return ObjectBoxManager.groupMembersBox.removeAsync(id);
  }

  List<Friends> getAllFriendsList() {
    return ObjectBoxManager.friendsBox.getAll();
  }

  List<Friends?> getFriends(List<int> friendIds) {
    return ObjectBoxManager.friendsBox.getMany(friendIds);
  }

  List<int> addNewFriends(List<Friends> friends) {
    return ObjectBoxManager.friendsBox.putMany(friends);
  }
}