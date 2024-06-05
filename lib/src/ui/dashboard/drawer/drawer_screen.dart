import 'package:easy_localization/easy_localization.dart';
import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerScreen extends StatefulWidget {
  final screenIndex;

  const DrawerScreen({
    Key? key,
    this.screenIndex,
  }) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  List<DrawerList>? drawerList;
  var iconAnimationController;
  var animationController;

  @override
  void initState() {
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        labelName: tr("manageStudents"),
        icon: Icon(Icons.manage_accounts),
      ),
      DrawerList(
        //index: DrawerIndex.FeedBack,
        labelName: tr('manageStaff'),
        icon: Icon(Icons.groups),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('manageClasses'),
        icon: Icon(Icons.group),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('manageSubject'),
        icon: Icon(Icons.menu_book),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('timeTable'),
        icon: Icon(Icons.lock_clock),
      ),
      DrawerList(
        //index: DrawerIndex.Share,
        labelName: tr('attendance'),
        icon: Icon(Icons.fingerprint),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('work'),
        icon: Icon(Icons.auto_stories),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('ledger'),
        icon: Icon(Icons.wallet),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('leave'),
        icon: Icon(Icons.calendar_month),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('complaints'),
        icon: Icon(Icons.notification_important),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('transport'),
        icon: Icon(Icons.bus_alert),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('exam'),
        icon: Icon(Icons.developer_board_sharp),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('document'),
        icon: Icon(Icons.document_scanner_sharp),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('library'),
        icon: Icon(Icons.my_library_books),
      ),
      DrawerList(
        //index: DrawerIndex.Invite,
        labelName: tr('hostel'),
        icon: Icon(Icons.house_outlined),
      ),
      DrawerList(
        //index: DrawerIndex.About,
        labelName: tr('aboutUs'),
        icon: Icon(Icons.info),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: iconAnimationController!,
                        builder: (BuildContext context, Widget? child) {
                          return ScaleTransition(
                            scale: AlwaysStoppedAnimation<double>(
                                1.0 - (iconAnimationController!.value) * 0.2),
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation<double>(
                                  Tween<double>(begin: 0.0, end: 24.0)
                                          .animate(CurvedAnimation(
                                              parent: iconAnimationController!,
                                              curve: Curves.fastOutSlowIn))
                                          .value /
                                      360),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: colorGray.withOpacity(0.6),
                                        offset: const Offset(2.0, 4.0),
                                        blurRadius: 8),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(60.0)),
                                  child: Image.asset(AppAssets.logo),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GSS School (Boys)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: isLightMode ? colorGray : colorWhite,
                                fontSize: 18,
                              ),
                            ),
                            TextView(
                              text: "Vpo Panjgrain kalan Dist Faridkot",
                              color: colorBlack,
                              textSize: 13.sp,
                              textAlign: TextAlign.left,
                              style: AppTextStyleEnum.small,
                              fontFamily: Family.regular,
                              lineHeight: 1.3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  top: 50,
                  child: TapWidget(
                    onTap: context.back,
                    child: Icon(
                      Icons.close,
                      color: colorBlack,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList?.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList![index], index);
              },
            ),
          ),
          Divider(
            height: 1,
            color: colorGray.withOpacity(0.6),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: TextView(
                  text: "signOut",
                  color: colorPrimary,
                  // Set text color to black
                  textSize: 16.sp,
                  textAlign: TextAlign.left,
                  style: AppTextStyleEnum.title,
                  fontFamily: Family.medium,
                  lineHeight: 1.3,
                ),
                trailing: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: () {
                  onTapped();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }

  void onTapped() {
    print('Doing Something...'); // Print to console.
  }

  Widget inkwell(DrawerList listData, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen();
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    // decoration: BoxDecoration(
                    //   color: widget.screenIndex == listData.index
                    //       ? Colors.blue
                    //       : Colors.transparent,
                    //   borderRadius: new BorderRadius.only(
                    //     topLeft: Radius.circular(0),
                    //     topRight: Radius.circular(16),
                    //     bottomLeft: Radius.circular(0),
                    //     bottomRight: Radius.circular(16),
                    //   ),
                    // ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: colorBlack),
                        )
                      : Icon(listData.icon?.icon, color: colorBlack),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: colorBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.screenIndex == index
                ? AnimatedBuilder(
                    animation: iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 - iconAnimationController!.value - 1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen() async {}
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
}
