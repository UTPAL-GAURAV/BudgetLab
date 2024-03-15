import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_database/firebase_database.dart';

import '../BudgetModule/History/history_entity.dart';
import '../Shared/enums_manager.dart';
import 'FairShare_Entities/friends_entity.dart';
import 'FairShare_Entities/group_entity.dart';
import 'FairShare_Entities/group_members_entity.dart';
import 'FairShare_Entities/split_transaction_entity.dart';
import 'FairShare_Entities/transactions_entity.dart';
import 'Models/fairShare_GroupMembers_model.dart';
import 'Models/fairShare_GroupMetadata_model.dart';
import 'fairShare_service.dart';

class FairShareController {
  // Firebase realtime DB
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('LoanLend');  // Members is a table here, called as 'node' in firebase
  void someMethod(String groupId) {
    print("qqqqqqqq");

    FairShareGroupMembers g1 = FairShareGroupMembers(membersMap: {
      'person1': {'person2': 10, 'person3': 3},
      'person2': {'person1': -3, 'person2': 0},
    });

    FairShareGroupMetadata metadata = FairShareGroupMetadata(
      groupName: 'WonderLa',
      isGroup: true,
      icon: '',
    );

    databaseRef.child(groupId).set({
      'metadata': metadata.toJson(),
      'members': g1.toJson()
    }).then((value) {
      //show toast message
    }).onError((error, stackTrace) {
      print("error wwwwwwwwwww ------------------------");
      print(error);
      print(stackTrace);
    });
  }

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
