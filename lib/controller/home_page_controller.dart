import 'package:athletic/home/screens/client_mangament/Home_page.dart';
import 'package:athletic/home/screens/client_mangament/add_client/add_client.dart';
import 'package:athletic/home/screens/equipmnt_mangament/equipmen_screen.dart';
import 'package:athletic/home/screens/main_page.dart';
import 'package:athletic/home/screens/plan_mangament/plan_screen.dart';
import 'package:athletic/home/screens/show_coaches/add_coach.dart';
import 'package:athletic/home/screens/show_coaches/show_coaches.dart';
import 'package:athletic/home/screens/show_member/show.dart';
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
        widget: const Home_page()),
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
        widget: Show_Member()),
    HomeDrawerScreensModels(
        index: 4,
        icons: Icons.add,
        title: getText('add_day'),
        widget: const AddSession()),
    HomeDrawerScreensModels(
        index: 5,
        icons: Icons.workspace_premium_outlined,
        title: getText('add_emp'),
        widget: Add_Coach()),
    HomeDrawerScreensModels(
        index: 6,
        icons: Icons.people_alt,
        title: getText('show_emp'),
        widget: Show_Coaches()),
    HomeDrawerScreensModels(
        index: 7,
        icons: Icons.visibility_outlined,
        title: getText('equepment'),
        widget: const EquipmenScreen()),
    HomeDrawerScreensModels(
        index: 8,
        icons: Icons.food_bank_outlined,
        title: getText('add_food'),
        widget: const MainPage()),
    HomeDrawerScreensModels(
        index: 9,
        icons: Icons.panorama_fish_eye_sharp,
        title: getText('show_food'),
        widget: const MainPage()),
    HomeDrawerScreensModels(
        index: 10,
        icons: Icons.psychology_sharp,
        title: getText('add_practise'),
        widget: const MainPage()),
    HomeDrawerScreensModels(
        index: 11,
        icons: Icons.show_chart_sharp,
        title: getText('show_practise'),
        widget: const MainPage()),
  ];
  HomeDrawerScreensModels currentSelect = HomeDrawerScreensModels(
      index: 0,
      icons: Icons.home_outlined,
      title: getText('home_page'),
      widget: const MainPage());

  void setSelected(int index) {
    currentSelect = widgets[index];
    notifyListeners();
  }
}
