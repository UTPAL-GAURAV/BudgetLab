
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_members_entity.dart';

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

  Future<bool> deleteGroup(int id) {
    return ObjectBoxManager.groupBox.removeAsync(id);
  }

  List<Transactions> getAllGroupTransactions() {
    return ObjectBoxManager.transactionsBox.getAll();
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

  List<GroupMembers> getAllGroupMemberList() {
    return ObjectBoxManager.groupMembersBox.getAll();
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

  List<int> addNewFriends(List<Friends> friends) {
    return ObjectBoxManager.friendsBox.putMany(friends);
  }
}