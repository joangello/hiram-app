// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/home/bloc/home_bloc.dart';

extension _HomeStateX on HomeState {
  /// Returns the colors to the tab selected
  Color getColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.grey;
  }

  /// Returns The icon for the tabs
  Widget getIcon(bool isSelected) {
    switch (this) {
      case HomeState.home:
        return Icon(
          Icons.home,
          color: getColor(isSelected),
          size: 32,
        );

      case HomeState.search:
        return Icon(
          Icons.search,
          color: getColor(isSelected),
          size: 32,
        );

      case HomeState.favorites:
        return Icon(
          Icons.favorite,
          color: getColor(isSelected),
          size: 32,
        );

      case HomeState.profile:
        return Icon(
          Icons.account_circle,
          color: getColor(isSelected),
          size: 32,
        );
    }
  }
}

/// {@template home_bottom_navigation_bar}
///
/// Shows the bottom tab along with its options
///
/// {@endtemplate}
class HomeBottomNavigationBar extends StatelessWidget {
  /// The decoration for this [HomeBottomNavigationBar]
  BoxDecoration get _decoration => BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.grey[350]!,
          ),
        ),
      );

  //#region Initializers

  /// {@macro home_bottom_navigation_bar}
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.watch<HomeBloc>().state;

    return SafeArea(
      child: Container(
        decoration: _decoration,
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _HomeBottomNavigationBarItem(
              label: 'Home',
              isSelected: selectedTab == HomeState.home,
              selectedTab: HomeState.home,
            ),
            _HomeBottomNavigationBarItem(
              label: 'Search',
              isSelected: selectedTab == HomeState.search,
              selectedTab: HomeState.search,
            ),
            _HomeBottomNavigationBarItem(
              label: 'Favorites',
              isSelected: selectedTab == HomeState.favorites,
              selectedTab: HomeState.favorites,
            ),
            _HomeBottomNavigationBarItem(
              label: 'Profile',
              isSelected: selectedTab == HomeState.profile,
              selectedTab: HomeState.profile,
            ),
          ],
        ),
      ),
    );
  }

  //#endregion
}

class _HomeBottomNavigationBarItem extends StatelessWidget {
  /// The label for the tab
  final String label;

  /// A flag for the currently selected tab
  final bool isSelected;

  /// The currently selected tab
  final HomeState selectedTab;

  //#region Initializers
  const _HomeBottomNavigationBarItem({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.selectedTab,
  }) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTanChanged(context),
      child: SizedBox(
        height: 60,
        width: 90,
        child: Column(
          children: [
            selectedTab.getIcon(isSelected),
            Text(
              label,
              style: TextStyle(
                color: selectedTab.getColor(isSelected),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //#endregion

  //#region Private methods

  Future<void> _onTanChanged(BuildContext context) async {
    context.read<HomeBloc>().add(HomeTabChanged(selectedTab));
  }

  //#endregion
}
