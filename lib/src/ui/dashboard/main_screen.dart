import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/common_space.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/data/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:fl_school/src/ui/dashboard/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return SizedBox();
        } else if (state is DashboardSuccess) {
          return Scaffold(
            key: _key,
            backgroundColor: colorWhite,

            body: Stack(
              children: [
                state.widgetList[state.selectedIndex],
              ],
            ),


            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0.0,
              items: [],
              onTap: (index){
                      context
                          .read<DashboardBloc>()
                          .add(UpdateIndexEvent(index: index));
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
