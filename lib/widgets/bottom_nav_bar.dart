import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;

  Map<String, String> svgList = {
    'carbon_home' : 'Home',
    'carbon_task' : 'To-Do',
    'carbon_chart-line' : 'Track',
    'carbon_user-multiple' : 'Engage',
    'carbon_menu' : 'More',
  };

  void _onTap(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.primary;
    // TODO: implement build
    return BottomNavigationBar(
      items:
        svgList.entries.mapIndexed((index, svg) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/${svg.key}.svg',
            colorFilter: _selectedIndex == index
                ? ColorFilter.mode(
              selectedColor,
              BlendMode.srcIn,
            )
                : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          label: svg.value,
        )).toList(),
      currentIndex: _selectedIndex,
      onTap: (value) => _onTap(value),
      showUnselectedLabels: true,
      iconSize: 18,
      selectedItemColor: selectedColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontSize: 8,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 8,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
      ),
      type: BottomNavigationBarType.fixed,
    );
  }
}