
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
    return Column(
      children: <Widget>[
        Row(
            children: const [
              Expanded(
                flex: 2,
                child: Text(
                  "Features",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
        ),
        Row(
          children: [
            getLoanLendIconTile(context),
           const Padding(
             padding: EdgeInsets.all(8.0),
           ),
            getTransactionIconTile(context),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            getSavingsIconTile(context),
          ],
        )
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
          heroTag: "tag1",
          onPressed: () {
            Navigator.push(
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



getSavingsIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "tag2",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: routes['/savings']!));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.savings,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          ConstantsManager.SAVINGS,
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

getTransactionIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "tag3",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: routes['/transactions']!));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.receipt_long_sharp,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          ConstantsManager.INCOME_EXPENSE,
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