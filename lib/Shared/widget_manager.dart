import 'package:flutter/material.dart';

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


/**
 * Calendars
 */


/**
 * Bottom Navigation Bar
 */

getBottomNavigationBar() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'School',
      ),
    ],
    // currentIndex: _selectedIndex,
    selectedItemColor: Colors.amber[800],
    // onTap: _onItemTapped,
  );
}
