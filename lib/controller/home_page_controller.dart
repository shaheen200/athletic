import 'package:athletic/home/screens/client_mangament/Home_page.dart';
import 'package:athletic/home/screens/client_mangament/add_client/add_client.dart';
import 'package:athletic/home/screens/equipmnt_mangament/equipmen_screen.dart';
import 'package:athletic/home/screens/goods_mangament/goods_screen.dart';
import 'package:athletic/home/screens/me_mangament/my_info_screen.dart';
import 'package:athletic/home/screens/plan_mangament/plan_screen.dart';
import 'package:athletic/home/screens/show_empolyee/add_empolyee.dart';
import 'package:athletic/home/screens/show_empolyee/show/show_empolyee.dart';
import 'package:athletic/home/screens/show_member/show.dart';
import 'package:athletic/home/screens/store/store_page.dart';
import 'package:athletic/models/home_drawer_screens_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:flutter/material.dart';

import '../home/screens/client_mangament/add_client/add_Session.dart';

class HomePageController extends ChangeNotifier {
  final List<HomeDrawerScreensModels> widgets = [
    HomeDrawerScreensModels(
        index: 0,
        icons: Icons.home_outlined,
        title: getText('home_page'),
        widget: const HomePage()),
    HomeDrawerScreensModels(
        index: 1,
        icons: Icons.paragliding_rounded,
        title: getText('plan'),
        widget: const PlanScreen()),
    HomeDrawerScreensModels(
        index: 2,
        icons: Icons.person_add,
        title: getText('add_client'),
        widget: const AddClient()),
    HomeDrawerScreensModels(
        index: 3,
        icons: Icons.people_outline,
        title: getText('show_client'),
        widget: const ShowMember(
          state: ShowMemeberState.active,
        )),
    HomeDrawerScreensModels(
        index: 4,
        icons: Icons.people_outline,
        title: getText('renew'),
        widget: const ShowMember(
          state: ShowMemeberState.notActive,
        )),
    HomeDrawerScreensModels(
        index: 5,
        icons: Icons.add,
        title: getText('add_day'),
        widget: const AddSession()),
    HomeDrawerScreensModels(
        index: 6,
        icons: Icons.workspace_premium_outlined,
        title: getText('add_emp'),
        widget: const AddEmpolyee()),
    HomeDrawerScreensModels(
        index: 7,
        icons: Icons.people_alt,
        title: getText('show_emp'),
        widget: const ShowEmpolyee()),
    HomeDrawerScreensModels(
        index: 8,
        icons: Icons.visibility_outlined,
        title: getText('equepment'),
        widget: const EquipmenScreen()),
    HomeDrawerScreensModels(
        index: 9,
        icons: Icons.food_bank_sharp,
        title: getText('goods'),
        widget: const GoodsScreen()),
    HomeDrawerScreensModels(
        index: 10,
        icons: Icons.store,
        title: getText('store'),
        widget: const StorePage()),
    HomeDrawerScreensModels(
        index: 11,
        icons: Icons.person,
        title: getText('me'),
        widget: const MyInfoScreen()),
    // HomeDrawerScreensModels(
    //     index: 8,
    //     icons: Icons.food_bank_outlined,
    //     title: getText('add_food'),
    //     widget: const MainPage()),
    // HomeDrawerScreensModels(
    //     index: 9,
    //     icons: Icons.panorama_fish_eye_sharp,
    //     title: getText('show_food'),
    //     widget: const MainPage()),
    // HomeDrawerScreensModels(
    //     index: 10,
    //     icons: Icons.psychology_sharp,
    //     title: getText('add_practise'),
    //     widget: const MainPage()),
    // HomeDrawerScreensModels(
    //     index: 11,
    //     icons: Icons.show_chart_sharp,
    //     title: getText('show_practise'),
    //     widget: const MainPage()),
  ];
  HomeDrawerScreensModels currentSelect = HomeDrawerScreensModels(
      index: 0,
      icons: Icons.home_outlined,
      title: getText('home_page'),
      widget: const HomePage());

  void setSelected(int index) {
    currentSelect = widgets[index];
    notifyListeners();
  }
}
