import 'FairShare_Entities/group_entity.dart';
import 'FairShare_Entities/group_members_entity.dart';
import 'FairShare_Entities/split_transaction_entity.dart';
import 'FairShare_Entities/transactions_entity.dart';
import 'fairShare_repository.dart';

class FairShareService {
  FairShareRepository fairShareRepository = FairShareRepository();

  List<Group> getAllGroupList() {
    return fairShareRepository.getAllGroupList();
  }

  int addNewGroup(Group group) {
    return fairShareRepository.addNewGroup(group);
  }

  List<Transactions> getAllGroupTransactions() {
    return fairShareRepository.getAllGroupTransactions();
  }

  int addNewGroupTransaction(Transactions transaction) {
    return fairShareRepository.addNewGroupTransaction(transaction);
  }

  List<SplitTransaction> getSplitTransactions(int transactionId) {
    return fairShareRepository.getSplitTransactions(transactionId);
  }

  int addNewSplitTransaction(SplitTransaction splitTransaction) {
    return fairShareRepository.addNewSplitTransaction(splitTransaction);
  }

  List<GroupMembers> getAllGroupMemberList() {
    return fairShareRepository.getAllGroupMemberList();
  }

  List<int> addNewGroupMember(List<GroupMembers> groupMembers) {
    return fairShareRepository.addNewGroupMember(groupMembers);
  }
}
