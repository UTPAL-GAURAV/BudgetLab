import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_service.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/friends_entity.dart';
import 'package:budgetlab/SettingsModule/metadata_service.dart';

import '../Shared/enums_manager.dart';
import 'FairShare_Entities/group_entity.dart';
import 'FairShare_Entities/group_members_entity.dart';
import 'FairShare_Entities/split_transaction_entity.dart';
import 'FairShare_Entities/transactions_entity.dart';
import 'fairShare_repository.dart';

class FairShareService {
  FairShareRepository fairShareRepository = FairShareRepository();
  HistoryService historyService = HistoryService();
  MetadataService metadataService = MetadataService();

  List<Group> getAllGroupList() {
    return fairShareRepository.getAllGroupList();
  }

  int addNewGroup(Group group) {
    return fairShareRepository.addNewGroup(group);
  }

  List<Transactions> getAllGroupTransactions(String groupId) {
    return fairShareRepository.getAllGroupTransactions(groupId);
  }

  int addNewGroupTransaction(Transactions transaction, History history) {
    // add in history
    historyService.addHistory(history);
    // subtract from Available Balance & Expendable amount
    metadataService.updateExpendableAmount(false, transaction.amount, true, false);
    //TODO: Calculate split amount for your worth (a model class is needed)
    // metadataService.updateYourWorth(false, amount);

    return fairShareRepository.addNewGroupTransaction(transaction);
  }

  List<SplitTransaction> getSplitTransactions(int transactionId) {
    return fairShareRepository.getSplitTransactions(transactionId);
  }

  int addNewSplitTransaction(SplitTransaction splitTransaction) {
    return fairShareRepository.addNewSplitTransaction(splitTransaction);
  }

  List<GroupMembers> getAllGroupMemberList(int groupId) {
    return fairShareRepository.getAllGroupMemberList(groupId);
  }

  List<Friends> getAllFriendsOfThisGroup(int groupId) {
    final List<GroupMembers> groupMembers = fairShareRepository.getAllGroupMemberList(groupId);
    List<int> groupFriendsIds = [];
    groupMembers.forEach((member) {
      groupFriendsIds.add(member.id);
    });
    return fairShareRepository.getFriends(groupFriendsIds).where((friend) => friend != null)
        .cast<Friends>() // Cast the list to remove nullability
        .toList();
  }

  List<int> addNewGroupMember(List<GroupMembers> groupMembers) {
    return fairShareRepository.addNewGroupMember(groupMembers);
  }
}
