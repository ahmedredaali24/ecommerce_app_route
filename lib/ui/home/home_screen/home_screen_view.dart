import 'package:e_commerce_route/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_route/ui/home/home_screen/cubit/home_states.dart';
import 'package:e_commerce_route/ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName="HomeScreenView";

  HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: buildCustomBottomNavigationBar(
              context: context,
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changeSelectedIndex(index);
              },
            ),
            body: viewModel.tabs[viewModel.selectedIndex],
          );
        });
  }
}
