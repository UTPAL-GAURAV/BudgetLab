import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';


/// Global Vars to be used by Widgets //////////////////////////////////////////
int currentBottomNavigationBarIndex = 0;


/// BUTTONS ////////////////////////////////////////////////////////////////////



/// Home Bottom Navigation Bar Button
// HomeNavigationButton getHomeNavigationButton() {
//   return const HomeNavigationButton();
// }
//
// class HomeNavigationButton extends StatefulWidget {
//   const HomeNavigationButton({Key? key}) : super(key: key);
//
//   @override
//   State<HomeNavigationButton> createState() => _HomeNavigationButtonState();
// }
//
// class _HomeNavigationButtonState extends State<HomeNavigationButton> {
//   bool isSelected = false;
//   Color notSelectedColor= Colors.black;
//
//   void toggleSelection() {
//     setState(() {
//       isSelected = !isSelected;
//       if(isSelected) {
//
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       focusColor: ColorManager.PRIMARY,
//       icon: const Icon(
//         Icons.home_rounded,
//         color: Color(0x1A57636C),
//         size: 24,
//       ),
//       onPressed: () {
//         setState(() {
//           // Update the iconColor variable with a new color
//           notSelectedColor = Colors.blue;
//         });
//         // handleButtonPress(context);
//         toggleSelection();
//         print('IconButton pressed ...');
//       },
//     );
//   }
// }


/// Text Boxes /////////////////////////////////////////////////////////////////
getHeaderDividerSizedBox(String displayText) {
  return SizedBox(
    child: Text(displayText),
  );
}


/// Calendars //////////////////////////////////////////////////////////////////


/// Bottom Navigation Bar //////////////////////////////////////////////////////

getBottomNavigationBar() {
  return const BottomMenuBar();
}

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
                  print('IconButton pressed ...');
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
                          print('MiddleButton pressed ...');
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
                    print('IconButton pressed ...');
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
                  navigateOnBottomNavigationButtonClick(3, context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void navigateOnBottomNavigationButtonClick(int index, context) {
  if (currentBottomNavigationBarIndex == index) {
    return; // Do nothing if the selected index is already the current index
  }
  currentBottomNavigationBarIndex = index;

  switch(index) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      break;
    case 3:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: routes['/settings']!));
      break;
  }
}



