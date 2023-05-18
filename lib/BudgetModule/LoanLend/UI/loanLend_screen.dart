import 'package:flutter/material.dart';

import '../../../Shared/constants_manager.dart';

class LoanLendScreen extends StatefulWidget {
  const LoanLendScreen({Key? key}) : super(key: key);

  @override
  State<LoanLendScreen> createState() => _LoanLendScreenState();
}

class _LoanLendScreenState extends State<LoanLendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsManager.APP_NAME),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
