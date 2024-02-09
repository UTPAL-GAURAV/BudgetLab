import 'package:contacts_service/contacts_service.dart';

import '../BudgetModule/History/history_entity.dart';
import '../Shared/enums_manager.dart';
import 'FairShare_Entities/friends_entity.dart';
import 'FairShare_Entities/group_entity.dart';
import 'FairShare_Entities/group_members_entity.dart';
import 'FairShare_Entities/split_transaction_entity.dart';
import 'FairShare_Entities/transactions_entity.dart';
import 'fairShare_service.dart';

class FairShareController {
  FairShareService fairShareService = FairShareService();

  // Group
  List<Group> getAllGroupList() {
    return fairShareService.getAllGroupList();
  }

  int addNewGroup(Group group) {
    return fairShareService.addNewGroup(group);
  }

  List<Transactions> getAllGroupTransactions(String groupId) {
    return fairShareService.getAllGroupTransactions(groupId);
  }

  int addNewGroupTransaction(Transactions transaction, History history) {
    return fairShareService.addNewGroupTransaction(transaction, history);
  }

  Future<bool> deleteGroup(int groupId) {
    return fairShareService.deleteGroup(groupId);
  }

  // Group Members
  List<GroupMembers> getAllGroupMemberList(int groupId) {
    return fairShareService.getAllGroupMemberList(groupId);
  }

  List<Friends> getAllFriendsOfThisGroup(int groupId) {
    return fairShareService.getAllFriendsOfThisGroup(groupId);
  }

  List<int> addNewGroupMember(List<GroupMembers> groupMembers) {
    return fairShareService.addNewGroupMember(groupMembers);
  }

  // Friends
  String getFriendNameFromId(String friendId) {
    return "friend 1";
  }

  // Individual
  int addNewIndividualTransaction(
      Transactions transaction, History history, List<Group> groups, List<Contact> contacts) {
    return 0;
  }

  // Transactions
  List<SplitTransaction> getSplitTransactions(int transactionId) {
    return fairShareService.getSplitTransactions(transactionId);
  }

  int addNewSplitTransaction(SplitTransaction splitTransaction) {
    return fairShareService.addNewSplitTransaction(splitTransaction);
  }
}
