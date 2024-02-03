import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Shared/color_manager.dart';
import '../../Shared/routes_manager.dart';
import 'fairShareGroupScrollableTransactions.dart';

class FairShareGroupScreen extends StatefulWidget {
  final Group group;
  const FairShareGroupScreen({Key? key, required this.group}) : super(key: key);

  @override
  State<FairShareGroupScreen> createState() => _FairShareGroupScreenState();
}

class _FairShareGroupScreenState extends State<FairShareGroupScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _shouldChangeColor = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _shouldChangeColor = _scrollController.offset > 100.0; // Adjust the offset as needed
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: _shouldChangeColor ? ColorManager.PRIMARY_BLUE : Colors.transparent,
            foregroundColor: Colors.white,
            expandedHeight: screenHeight(0.25, context),
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatars/neutralGreenHair.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.32),
                  ),
                ],
              ),
            ),
            title: Text(widget.group.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 28.0,
                ),
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppRouteConstants.fairShareGroupSettings, extra: widget.group);
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth(0.02, context),
                    0,
                    screenWidth(0.02, context),
                    10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balances",
                        style: TextStyle(
                          color: ColorManager.DARK_GREY,
                          fontSize: screenHeight(0.028, context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // TODO: getGroupBalances();

                      // TODO: getGroupOptions();
                      Text(
                        "Transactions",
                        style: TextStyle(
                          color: ColorManager.DARK_GREY,
                          fontSize: screenHeight(0.028, context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      getFairShareGroupScrollableTransactions(widget.group),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add, color: Colors.white),
        label: Text("Add Expense", style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context))),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRouteConstants.addFairShareTransaction, extra: widget.group);
        },
      ),
    );
  }
}
