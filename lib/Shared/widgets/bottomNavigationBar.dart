import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';

int currentBottomNavigationBarIndex = 0;

/// Public Method //////////////////////////////////////////////////////////////

getBottomNavigationBar() {
  return const BottomMenuBar();
}

/// Widget /////////////////////////////////////////////////////////////////////

class BottomMenuBar extends StatefulWidget {
  const BottomMenuBar({Key? key}) : super(key: key);

  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorManager.PRIMARY_BACKGROUND,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home_rounded,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  navigateOnBottomNavigationButtonClick(
                      RoutesIndex.HOME.value, context);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat_bubble_rounded,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ColorManager.PRIMARY,
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        color: Colors.amber,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          navigateOnBottomNavigationButtonClick(
                              RoutesIndex.INCOME_EXPENSE.value, context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.history,
                    color: Color(0xFF9299A1),
                    size: 24,
                  ),
                  onPressed: () {
                    navigateOnBottomNavigationButtonClick(
                        RoutesIndex.HISTORY.value, context);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  navigateOnBottomNavigationButtonClick(
                      RoutesIndex.SETTINGS.value, context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void navigateOnBottomNavigationButtonClick(int index, BuildContext context) {
  if (RoutesManager.currentBottomNavigationBarIndex == index) {
    return; // Do nothing if the selected index is already the current index
  }
  RoutesManager.currentBottomNavigationBarIndex = index;

  switch (index) {
    case 0:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: routes['/home']!));
      break;
    case 1:
      break;
    case 2:
      pushCurrentRouteOnHomeRoute(context, '/addIncomeExpense');
      break;
    case 3:
      break;
    case 4:
      pushCurrentRouteOnHomeRoute(context, '/settings');
      break;
    default:
      break;
  }
}

/// Used for BottomNavigationBar buttons
/// Replace all routes with Home and put current route on top of Home
void pushCurrentRouteOnHomeRoute(BuildContext context, String routePage) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: routes['/home']!),
    (route) => false,
  );

  Navigator.push(
    context,
    MaterialPageRoute(builder: routes[routePage]!),
  );
}
