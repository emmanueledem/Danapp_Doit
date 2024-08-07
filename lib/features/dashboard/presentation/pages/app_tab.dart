import 'dart:async';
import 'package:danapp_doit/core/core.dart';
import 'package:danapp_doit/features/features.dart';
import 'package:flutter/material.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({
    super.key,
  });

  @override
  AppTabViewState createState() => AppTabViewState();
}

class AppTabViewState extends State<AppTabView> {
  int? _selectedIndex;
  bool reload = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      reload = false;
    });
  }

  @override
  void initState() {
    setState(() {
      _selectedIndex = 0;
      reload = true;
    });

    /// get user data
    Future.delayed(Duration.zero, _getUser);
    super.initState();
  }

  Future<void> _getUser() async {
    // await BlocProvider.of<DashboardCubit>(context).getUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = <Widget?>[
      const HomeScreenView(),
      const AllProjects(),
      const SizedBox(),
    ];

    return Scaffold(
      extendBody: true,
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.blue,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
                size: 40,
              ),
            )
          : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: widgetOptions.elementAt(_selectedIndex!),
      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        height: 50,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          FABBottomAppBarItem(
            icon: _selectedIndex == 0 ? AppAssets.homeFill : AppAssets.home,
            text: '',
          ),
          FABBottomAppBarItem(
            icon: _selectedIndex == 1
                ? AppAssets.projectsFill
                : AppAssets.projects,
            text: '',
          ),
          FABBottomAppBarItem(
            icon: AppAssets.profile,
            text: '',
          ),
        ],
      ),
    );
  }
}
