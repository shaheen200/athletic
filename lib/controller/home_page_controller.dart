import 'package:athletic/home/screens/client_mangament/Home_page.dart';
import 'package:athletic/home/screens/client_mangament/add_client/add_client.dart';
import 'package:athletic/home/screens/close_day/show_close_day.dart';
import 'package:athletic/home/screens/equipmnt_mangament/equipmen_screen.dart';
import 'package:athletic/home/screens/goods_mangament/goods_screen.dart';
import 'package:athletic/home/screens/me_mangament/my_info_screen.dart';
import 'package:athletic/home/screens/offers/show_offers.dart';
import 'package:athletic/home/screens/plan_mangament/plan_screen.dart';
import 'package:athletic/home/screens/show_empolyee/add_empolyee.dart';
import 'package:athletic/home/screens/show_empolyee/show/show_empolyee.dart';
import 'package:athletic/home/screens/show_member/show.dart';
import 'package:athletic/home/screens/store/store_page.dart';
import 'package:athletic/home/screens/time_work/time_work_screen.dart';
import 'package:athletic/models/home_drawer_screens_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:flutter/material.dart';
import '../home/screens/client_mangament/add_client/add_Session.dart';

class HomePageController extends ChangeNotifier {
  List<HomeDrawerScreensModels> get widgets => _data;
  List<HomeDrawerScreensModels> _data = [];
  HomeDrawerScreensModels currentSelect = HomeDrawerScreensModels(
      index: 0,
      icons: Icons.home_outlined,
      title: getText('home_page'),
      widget: const HomePage());

  void setSelected(int index) {
    currentSelect = _data[index];
    notifyListeners();
  }

  void opened(bool admin) {
    if (admin) {
      _data = _widgets;
    } else {
      List<HomeDrawerScreensModels> xx = [];
      final x = _widgets.where((element) => !element.adminOnly).toList();
      for (var i = 0; i < x.length; i++) {
        xx.add(HomeDrawerScreensModels(
            index: i,
            icons: x[i].icons,
            title: x[i].title,
            widget: x[i].widget));
      }
      _data = xx;
    }
    notifyListeners();
  }
}

final List<HomeDrawerScreensModels> _widgets = [
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 0,
      icons: Icons.home_outlined,
      title: getText('home_page'),
      widget: const HomePage()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 1,
      icons: Icons.paragliding_rounded,
      title: getText('plan'),
      widget: const PlanScreen(
        type: PlanScreenType.month,
      )),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 2,
      icons: Icons.paragliding_rounded,
      title: getText('plan_day'),
      widget: const PlanScreen(type: PlanScreenType.days)),
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 3,
      icons: Icons.person_add,
      title: getText('add_client'),
      widget: const AddClient()),
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 4,
      icons: Icons.people_outline,
      title: getText('show_client'),
      widget: const ShowMember(
        state: ShowMemeberState.active,
      )),
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 5,
      icons: Icons.people_outline,
      title: getText('renew'),
      widget: const ShowMember(
        state: ShowMemeberState.notActive,
      )),
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 6,
      icons: Icons.add,
      title: getText('add_day'),
      widget: const AddSession()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 7,
      icons: Icons.workspace_premium_outlined,
      title: getText('add_emp'),
      widget: const AddEmpolyee()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 8,
      icons: Icons.people_alt,
      title: getText('show_emp'),
      widget: const ShowEmpolyee()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 9,
      icons: Icons.visibility_outlined,
      title: getText('equepment'),
      widget: const EquipmenScreen()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 10,
      icons: Icons.food_bank_sharp,
      title: getText('goods'),
      widget: const GoodsScreen()),
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 11,
      icons: Icons.store,
      title: getText('store'),
      widget: const StorePage()),
  HomeDrawerScreensModels(
      adminOnly: false,
      index: 12,
      icons: Icons.person,
      title: getText('me'),
      widget: const MyInfoScreen()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 13,
      icons: Icons.local_offer,
      title: getText('offers'),
      widget: const ShowOffers()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 14,
      icons: Icons.attach_money_rounded,
      title: getText('close_day'),
      widget: const ShowCloseDay()),
  HomeDrawerScreensModels(
      adminOnly: true,
      index: 15,
      icons: Icons.timelapse_rounded,
      title: getText('table_work'),
      widget: const TimeWorkScreen()),
];
/**
 * List<HomeDrawerScreensModels> get widgets => _data;
  List<HomeDrawerScreensModels> _data = [];
  final List<HomeDrawerScreensModels> _widgets = [
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 0,
        icons: Icons.home_outlined,
        title: getText('home_page'),
        widget: const HomePage()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 1,
        icons: Icons.paragliding_rounded,
        title: getText('plan'),
        widget: const PlanScreen(
          type: PlanScreenType.month,
        )),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 2,
        icons: Icons.paragliding_rounded,
        title: getText('plan_day'),
        widget: const PlanScreen(type: PlanScreenType.days)),
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 3,
        icons: Icons.person_add,
        title: getText('add_client'),
        widget: const AddClient()),
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 4,
        icons: Icons.people_outline,
        title: getText('show_client'),
        widget: const ShowMember(
          state: ShowMemeberState.active,
        )),
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 5,
        icons: Icons.people_outline,
        title: getText('renew'),
        widget: const ShowMember(
          state: ShowMemeberState.notActive,
        )),
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 6,
        icons: Icons.add,
        title: getText('add_day'),
        widget: const AddSession()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 7,
        icons: Icons.workspace_premium_outlined,
        title: getText('add_emp'),
        widget: const AddEmpolyee()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 8,
        icons: Icons.people_alt,
        title: getText('show_emp'),
        widget: const ShowEmpolyee()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 9,
        icons: Icons.visibility_outlined,
        title: getText('equepment'),
        widget: const EquipmenScreen()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 10,
        icons: Icons.food_bank_sharp,
        title: getText('goods'),
        widget: const GoodsScreen()),
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 11,
        icons: Icons.store,
        title: getText('store'),
        widget: const StorePage()),
    HomeDrawerScreensModels(
        adminOnly: false,
        index: 12,
        icons: Icons.person,
        title: getText('me'),
        widget: const MyInfoScreen()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 13,
        icons: Icons.local_offer,
        title: getText('offers'),
        widget: const ShowOffers()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 14,
        icons: Icons.attach_money_rounded,
        title: getText('close_day'),
        widget: const ShowCloseDay()),
    HomeDrawerScreensModels(
        adminOnly: true,
        index: 15,
        icons: Icons.timelapse_rounded,
        title: getText('table_work'),
        widget: const TimeWorkScreen()),
  ];
  HomeDrawerScreensModels currentSelect = HomeDrawerScreensModels(
      index: 0,
      icons: Icons.home_outlined,
      title: getText('home_page'),
      widget: const HomePage());

  void setSelected(int index) {
    currentSelect = _data[index];
    notifyListeners();
  }

  void opened(bool admin) {
    if (admin) {
      _data = _widgets;
    } else {
      _data = _widgets.where((element) => !element.adminOnly).toList();
    }
    notifyListeners();
  }
 */
