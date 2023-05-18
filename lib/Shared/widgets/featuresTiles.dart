
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';

/// Public Method //////////////////////////////////////////////////////////////

getFeaturesTiles() {
  return const FeaturesTiles();
}


/// Widget /////////////////////////////////////////////////////////////////////

class FeaturesTiles extends StatefulWidget {
  const FeaturesTiles({Key? key}) : super(key: key);

  @override
  State<FeaturesTiles> createState() => _FeaturesTilesState();
}

class _FeaturesTilesState extends State<FeaturesTiles> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getLoanLendIconTile(context),
      ],
    );
  }
}


/// ICON BUTTONS ///////////////////////////////////////////////////////////////

getLoanLendIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: routes['/loanLend']!));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.swap_horiz,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          ConstantsManager.LOAN_LEND,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
