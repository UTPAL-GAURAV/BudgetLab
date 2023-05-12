import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';

/// Global Vars to be used by Widgets
int currentBottomNavigationBarIndex = 0;


/**
 * Buttons
 */

ThemeData getButtonTheme1() {
  return ThemeData(
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
    )
  );
}

/**
 * Text Boxes
 */
getHeaderDividerSizedBox(String displayText) {
  return SizedBox(
    child: Text(displayText),
  );
}


/**
 * Calendars
 */


/**
 * Bottom Navigation Bar
 */

getBottomNavigationBar() {
  return const BottomMenuBar();
}

class BottomMenuBar extends StatefulWidget {
  const BottomMenuBar({Key? key}) : super(key: key);

  @override
  State<BottomMenuBar> createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.amber[800],
      currentIndex: currentBottomNavigationBarIndex,
      onTap: (int index) => setState(() {
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
      }),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      // currentIndex: _selectedIndex,
      // onTap: _onItemTapped,
    );
  }
}



