
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Shared/color_manager.dart';
import '../../Shared/routes_manager.dart';

class SelectFairShareIndividualScreen extends StatefulWidget {
  const SelectFairShareIndividualScreen({Key? key}) : super(key: key);

  @override
  State<SelectFairShareIndividualScreen> createState() => _SelectFairShareIndividualScreenState();
}

class _SelectFairShareIndividualScreenState extends State<SelectFairShareIndividualScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fair Share"),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
      ),

      body: Container(
        child: Text("SelectFairShareIndividualScreen"),
      ),
    );
  }
}
