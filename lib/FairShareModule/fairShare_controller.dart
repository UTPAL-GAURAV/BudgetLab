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

  List<Transactions> getAllGroupTransactions() {
    return fairShareService.getAllGroupTransactions();
  }

  int addNewGroupTransaction(Transactions transaction) {
    return fairShareService.addNewGroupTransaction(transaction);
  }

  List<SplitTransaction> getSplitTransactions(int transactionId) {
    return fairShareService.getSplitTransactions(transactionId);
  }

  int addNewSplitTransaction(SplitTransaction splitTransaction) {
    return fairShareService.addNewSplitTransaction(splitTransaction);
  }

  List<GroupMembers> getAllGroupMemberList() {
    return fairShareService.getAllGroupMemberList();
  }

  List<int> addNewGroupMember(List<GroupMembers> groupMembers) {
    return fairShareService.addNewGroupMember(groupMembers);
  }
}
