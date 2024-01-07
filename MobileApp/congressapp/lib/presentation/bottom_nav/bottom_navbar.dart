import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.navigationShell.currentIndex,
          selectedItemColor: redColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            _goBranch(selectedIndex);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: AppStrings.chat,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll_rounded),
              label: AppStrings.polls,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              label: AppStrings.more,
            ),
          ]),
    );
  }
}
