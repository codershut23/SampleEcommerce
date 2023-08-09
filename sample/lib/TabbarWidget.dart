// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class TabBarWidget extends StatefulWidget {
//   const TabBarWidget({Key? key}) : super(key: key);

//   @override
//   _TabBarWidgetState createState() => _TabBarWidgetState();
// }

// class _TabBarWidgetState extends State<TabBarWidget> {
//   int pageIndex = 0;
//   String? _profile_pic;
//   bool isLoading = true;
//   final pages = [];
//   List<dynamic>? listmoduleDetails = [], settingsModuleDetails = [];
//   List<int> bottomMenuStatus = [];
//   Color? mainThemeColor, buttonmenuclr;
//   String? imagePath = "";
//   bool _loading = true;
//   final GlobalKey<_TabBarWidgetState> keyState =
//       GlobalKey<_TabBarWidgetState>();

//   Function? callBack(dynamic valueChecked) {
//     // pullToRefresh();
//   }

//   @override
//   void initState() {
//     super.initState();

//     _loadCounter();

//     getModuleDatas();
//     getLogo();
//     // pages.add(FeedPage());

//     // Below method is to listen the foreground notification

//     // FirebaseMessaging.onMessage.listen((RemoteMessage event) {
//     //   print('background message ${event.notification!.body}');
//     // });


//     makePollListAPICall(1);
//   }


//   void moduleCheck(String? token, String? moduleName) {
//     // print("tokensValues:" + token!);
//     // If bottom_module_status == 1 app bar will be hidden
//     switch (token) {
//       case 'members':
//         return pages.add(DirectoryScreen(
//           customModuleName: moduleName,
//           bottom_menu_status: 1,
//         ));
//       case 'community':
//         return pages.add(CommunityDashboardPage(
//           title: moduleName,
//           bottom_module_status: 1,
//         ));
//       case 'settings':
//         return pages.add(MenuScreen(
//           title: "Menu",
//           pic: _profile_pic,
//         ));
//       case 'coupons':
//         return pages.add(NewCouponsPage(
//           module_bottom_status: 1,
//         ));

//       case 'scoringsystem':
//         return pages.add(WalletPage(
//           module_bottom_status: 1,
//         ));
//       case 'scoring-leaderboard':
//         return pages.add(
//           LeaderBoardDashboard(),
//           // OngoingEvent(title: moduleName)
//         );
//       case 'events':
//         return pages
//             .add(EventsList(title: moduleName, bottom_module_status: 1));
//       case 'politicalfundraising':
//         return pages.add(FundRaiserHome(title: moduleName));
//       case 'feeds':
//         return pages.add(FeedPage());
//       case 'imagegallery':
//         return pages.add(GalleryDashBoard(
//           title: moduleName,
//           bottom_module_status: 1,
//         ));
//       case 'noticeboard':
//         return pages.add(NoticeboardList(
//           title: moduleName,
//           bottom_module_status: 1,
//         ));
//       case 'polls':
//         // return pages.add(OpenPollPage());

//         return pages.add(PollsDashboardPage(
//           title: moduleName,
//           bottom_module_status: 1,
//         ));
//       case 'videogallery':
//         return pages
//             .add(VideoListPage(title: moduleName, bottom_module_status: 0));
//       case 'quest':
//         return pages.add(QuestQuestionPage());

//       // case 'home':
//       //   return pages.add(FeedPage());

//       default:
//         return pages.add(DirectoryScreen());
//     }
//   }

//   _loadCounter() async {
//     _profile_pic = await getProfilePic();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         return Future.value(false);
//       },
//       child: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Scaffold(
//               backgroundColor: const Color(0xffC4DFCB),
//               appBar: mainAppbar(),
//               body: pages[pageIndex],
//               bottomNavigationBar: buildMyNavBar(context),
//             ),
//     );
//   }

//   mainAppbar() {
//     print("pageLength:" + pages.length.toString());

//     if (pageIndex == 0) {
//       return appBarUI_module_1(pageIndex);
//     } else if (pageIndex == 1) {
//       // return appBarUI_module_2(listmoduleDetails![1].customModuleName);
//     } else if (pageIndex == 2) {
//       // return listmoduleDetails![2].moduleToken == "coupons"
//       //     ? null
//       //     : appBarUI_module_2(listmoduleDetails![2].customModuleName);
//     }
//     // else if (pageIndex == 3) {
//     //   return listmoduleDetails![3].moduleToken == "coupons"
//     //       ? null
//     //       : appBarUI_module_2(listmoduleDetails![3].customModuleName);
//     // }
//     // else if (pageIndex == 3) {
//     //   return appBarUI_module_2("Menu");
//     // }

//     //   if (pages.length == 1) {
//     //   return appBarUI_module_1();
//     // } else if (pages.length == 2) {
//     //   return pageIndex == 0
//     //       ? appBarUI_module_1()
//     //       : appBarUI_module_2(listmoduleDetails![1].customModuleName);
//     // } else if (pages.length == 3) {
//     //   return pageIndex == 0
//     //       ? appBarUI_module_1()
//     //       : appBarUI_module_2(listmoduleDetails![1].customModuleName);
//     // } else if (pages.length == 4) {
//     //   return pageIndex == 0
//     //       ? appBarUI_module_1()
//     //       : appBarUI_module_2(listmoduleDetails![1].customModuleName);
//     // } else {
//     //   return pageIndex == 0
//     //       ? appBarUI_module_1()
//     //       : appBarUI_module_2(listmoduleDetails![1].customModuleName);
//     // }
//     // else {
//     //   appBarUI_module_1();
//     // }
//   }

//   Widget appBarUI_module_1(int index) {
//     return pageIndex == index
//         ? AppBar(
//             systemOverlayStyle: SystemUiOverlayStyle(
//                 systemNavigationBarColor: Colors.black, // Navigation bar
//                 statusBarColor: Colors.transparent,
//                 statusBarIconBrightness: Brightness.dark // Status bar
//                 ),
//             backgroundColor: Colors.white,
//             elevation: 0,
//             leadingWidth: 80,
//             centerTitle: false,
//             leading: Transform.translate(
//                 offset: const Offset(12, 0),
//                 child: imagePath!.isEmpty
//                     ? Container()
//                     : Image.network(
//                         imagePath!,
//                         height: 50,
//                       )),
//             actions: [
//                 // InkWell(
//                 //   child: Image.asset(
//                 //     "lib/assets/images/create_icon.png",
//                 //     width: 22,
//                 //     height: 22,
//                 //     color: black_1,
//                 //   ),
//                 //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                 //       builder: (context) => FeedPostScreen())),
//                 // ),
//                 SizedBox(width: 15),
//                 Text(buttonmenuclr.toString()),
//                 InkWell(
//                   child: Image.asset(
//                     "lib/assets/images/notification.png",
//                     width: 22,
//                     height: 22,
//                     color: buttonmenuclr,
//                   ),
//                   onTap: (){},
//                   //  Navigator.of(context).push(MaterialPageRoute(
//                   //     builder: (context) => NotificationPage())),
//                 ),
//                 SizedBox(width: 15),
//                 // IconButton(
//                 //   icon: Image.asset(
//                 //     "lib/assets/images/createcommunity.png",
//                 //     height: 30,
//                 //     color: black_1,
//                 //   ),
//                 //   onPressed: () => Navigator.of(context).push(
//                 //       MaterialPageRoute(
//                 //           builder: (context) => LandingPageIgloo())),
//                 // ),
//                 InkWell(
//                   child: Image.asset(
//                     "lib/assets/images/message_newIc1.png",
//                     width: 22,
//                     height: 22,
//                     color: buttonmenuclr,
//                   ),
//                   onTap: ()
//                   {

//                   },
//                   //  => Navigator.of(context).push(MaterialPageRoute(
//                   //     builder: (context) =>
//                   //         // OnBoarding())),
//                   //         RequestsControl())),
//                 ),
//                 SizedBox(width: 17),
//                 isLoading == true
//                     ? IconButton(
//                         icon: Image.asset(
//                           "lib/assets/images/dummy_profile_ic.png",
//                         ),
//                         onPressed: () {
//                           navigationTo_UpdateProfile();
//                         })
//                     : GestureDetector(
//                         onTap: () {
//                           navigationTo_UpdateProfile();
//                         },
//                         child: CircleAvatar(
//                           radius: 16,
//                           backgroundColor: Colors.grey,
//                           child: Stack(
//                             children: [
//                               CachedNetworkImage(
//                                 imageUrl: _profile_pic!,
//                                 imageBuilder: (context, imageProvider) =>
//                                     CircleAvatar(
//                                   radius: 15,
//                                   backgroundImage: imageProvider,
//                                   backgroundColor: white,
//                                 ),
//                                 placeholder: (context, url) =>
//                                     loadingWidgetMaker(),
//                                 errorWidget: (context, url, error) =>
//                                     CircleAvatar(
//                                   radius: 15,
//                                   backgroundImage: AssetImage(
//                                       'lib/assets/images/dummy_profile_ic.png'),
//                                   backgroundColor: Colors.white,
//                                 ),
//                               )
//                             ],
//                           ),
//                         )),
//                 SizedBox(width: 10)
//               ])
//         : pageIndex == 1
//             ? AppBar(
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                     systemNavigationBarColor: Colors.black, // Navigation bar
//                     statusBarColor: Colors.transparent,
//                     statusBarIconBrightness: Brightness.dark // Status bar
//                     ),
//                 backgroundColor: white,
//                 elevation: 0,
//                 automaticallyImplyLeading: false,
//                 centerTitle: false,
//                 title: Container(
//                   padding: const EdgeInsets.only(right: 28, left: 8),
//                   margin: EdgeInsets.only(right: 50),
//                   child: Text(
//                     listmoduleDetails![0].customModuleName,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: black_1),
//                   ),
//                 ),
//               )
//             : Container();
//   }

//   appBarUI_module_2(String customModuleName) {
//     return AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle(
//             systemNavigationBarColor: Colors.black, // Navigation bar
//             statusBarColor: Colors.transparent,
//             statusBarIconBrightness: Brightness.dark // Status bar
//             ),
//         backgroundColor: white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         centerTitle: false,
//         title: Container(
//             padding: const EdgeInsets.only(right: 28, left: 8),
//             margin: EdgeInsets.only(right: 50),
//             child: Text(
//               customModuleName,
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: black_1),
//             )));
//   }

//   appBarUI_module_3() {
//     pageIndex == 3
//         ? null
//         : pageIndex == 0
//             ? AppBar(
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                     systemNavigationBarColor: Colors.black, // Navigation bar
//                     statusBarColor: Colors.transparent,
//                     statusBarIconBrightness: Brightness.dark // Status bar
//                     ),
//                 backgroundColor: white,
//                 elevation: 0,
//                 automaticallyImplyLeading: false,
//                 centerTitle: false,
//                 title: Container(
//                   padding: const EdgeInsets.only(right: 28, left: 8),
//                   margin: EdgeInsets.only(right: 50),
//                   child: Text(
//                     listmoduleDetails![0].customModuleName,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: black_1),
//                   ),
//                 ),
//                 actions: <Widget>[
//                   // IconButton(
//                   //   icon: Image.asset(
//                   //     "lib/assets/images/search.png",
//                   //   ),
//                   //   onPressed: () {},
//                   // ),
//                   // IconButton(
//                   //   icon: Image.asset(
//                   //     "lib/assets/images/filter.png",
//                   //   ),
//                   //   onPressed: () {},
//                   // ),
//                 ],
//               )
//             : pageIndex == 1
//                 ? AppBar(
//                     systemOverlayStyle: SystemUiOverlayStyle(
//                         systemNavigationBarColor:
//                             Colors.black, // Navigation bar
//                         statusBarColor: Colors.transparent,
//                         statusBarIconBrightness: Brightness.dark // Status bar
//                         ),
//                     backgroundColor: white,
//                     elevation: 0,
//                     automaticallyImplyLeading: false,
//                     centerTitle: false,
//                     title: Container(
//                       padding: const EdgeInsets.only(right: 28, left: 8),
//                       margin: EdgeInsets.only(right: 50),
//                       child: Text(
//                         listmoduleDetails![0].customModuleName,
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: black_1),
//                       ),
//                     ),
//                     actions: <Widget>[
//                       // IconButton(
//                       //   icon: Image.asset(
//                       //     "lib/assets/images/search.png",
//                       //   ),
//                       //   onPressed: () {},
//                       // ),
//                       // IconButton(
//                       //   icon: Image.asset(
//                       //     "lib/assets/images/filter.png",
//                       //   ),
//                       //   onPressed: () {},
//                       // ),
//                     ],
//                   )
//                 : pageIndex == 2
//                     ? AppBar(
//                         systemOverlayStyle: SystemUiOverlayStyle(
//                             systemNavigationBarColor:
//                                 Colors.black, // Navigation bar
//                             statusBarColor: Colors.transparent,
//                             statusBarIconBrightness:
//                                 Brightness.dark // Status bar
//                             ),
//                         backgroundColor: white,
//                         elevation: 0,
//                         automaticallyImplyLeading: false,
//                         centerTitle: false,
//                         title: Container(
//                           padding: const EdgeInsets.only(right: 28),
//                           margin: EdgeInsets.only(right: 50),
//                           child: Text(
//                             listmoduleDetails![1].customModuleName,
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: black_1),
//                           ),
//                         ),
//                         actions: <Widget>[
//                           // IconButton(
//                           //   icon: Image.asset(
//                           //     "lib/assets/images/search.png",
//                           //   ),
//                           //   onPressed: () {},
//                           // ),
//                           // IconButton(
//                           //   icon: Image.asset(
//                           //     "lib/assets/images/filter.png",
//                           //   ),
//                           //   onPressed: () {},
//                           // ),
//                         ],
//                       )
//                     : AppBar(
//                         systemOverlayStyle: SystemUiOverlayStyle(
//                             systemNavigationBarColor:
//                                 Colors.black, // Navigation bar
//                             statusBarColor: Colors.transparent,
//                             statusBarIconBrightness:
//                                 Brightness.dark // Status bar
//                             ),
//                         backgroundColor: Colors.white,
//                         elevation: 0,
//                         leadingWidth: 80,
//                         centerTitle: false,
//                         leading: Transform.translate(
//                             offset: const Offset(12, 0),
//                             child: imagePath!.isEmpty
//                                 ? Container()
//                                 : Image.network(
//                                     imagePath!,
//                                     height: 50,
//                                   )),
//                         actions: [
//                           // InkWell(
//                           //   child: Image.asset(
//                           //     "lib/assets/images/create_icon.png",
//                           //     width: 22,
//                           //     height: 22,
//                           //     color: black_1,
//                           //   ),
//                           //   onTap: () => Navigator.of(context).push(
//                           //       MaterialPageRoute(
//                           //           builder: (context) => FeedPostScreen())),
//                           // ),
//                           SizedBox(width: 15),
//                           InkWell(
//                             child: Image.asset(
//                               "lib/assets/images/notification.png",
//                               width: 22,
//                               height: 22,
//                               color: black_1,
//                             ),
//                             onTap: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (context) => NotificationPage())),
//                           ),
//                           SizedBox(width: 15),
//                           // IconButton(
//                           //   icon: Image.asset(
//                           //     "lib/assets/images/createcommunity.png",
//                           //     height: 30,
//                           //     color: black_1,
//                           //   ),
//                           //   onPressed: () => Navigator.of(context).push(
//                           //       MaterialPageRoute(
//                           //           builder: (context) => LandingPageIgloo())),
//                           // ),
//                           InkWell(
//                             child: Image.asset(
//                               "lib/assets/images/message_newIc.png",
//                               width: 22,
//                               height: 22,
//                               color: black_1,
//                             ),
//                             onTap: () =>
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) =>
//                                         // OnBoarding())),
//                                         RequestsControl())),
//                           ),
//                           SizedBox(width: 17),
//                           isLoading == true
//                               ? IconButton(
//                                   icon: Image.asset(
//                                     "lib/assets/images/dummy_profile_ic.png",
//                                   ),
//                                   onPressed: () {
//                                     navigationTo_UpdateProfile();
//                                   })
//                               : GestureDetector(
//                                   onTap: () {
//                                     navigationTo_UpdateProfile();
//                                   },
//                                   child: CircleAvatar(
//                                     radius: 16,
//                                     backgroundColor: grey_1,
//                                     child: Stack(
//                                       children: [
//                                         CachedNetworkImage(
//                                           imageUrl: _profile_pic!,
//                                           imageBuilder:
//                                               (context, imageProvider) =>
//                                                   CircleAvatar(
//                                             radius: 15,
//                                             backgroundImage: imageProvider,
//                                             backgroundColor: white,
//                                           ),
//                                           placeholder: (context, url) =>
//                                               loadingWidgetMaker(),
//                                           errorWidget: (context, url, error) =>
//                                               CircleAvatar(
//                                             radius: 15,
//                                             backgroundImage: AssetImage(
//                                                 'lib/assets/images/dummy_profile_ic.png'),
//                                             backgroundColor: Colors.white,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )),
//                           SizedBox(width: 10),
//                         ],
//                       );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     print("pageLength:" + pages.length.toString());
//     return Container(
//       height: Platform.isIOS ? 80 : 60,
//       decoration: BoxDecoration(
//         color: white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5),
//           topRight: Radius.circular(5),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 // bottomMenus_1

//                 InkWell(
//                   onTap: () {
//                     pageIndex = 0;
//                     _loadCounter();
//                   },
//                   child: Container(
//                       child: Column(
//                     children: [
//                       Container(
//                           height: 40,
//                           child: pageIndex == 0
//                               ? new Image.asset(
//                                   'lib/assets/images/home.png',
//                                   height: 30,
//                                   width: 30,
//                                   color: bottomSelectedMenuColor,
//                                 )
//                               : new Image.asset('lib/assets/images/home.png',
//                                   height: 30, width: 30)),
//                       if (pageIndex == 0)
//                         Text(
//                           listmoduleDetails![0].customModuleName,
//                           style: TextStyle(
//                               color: bottomSelectedMenuColor,
//                               fontSize: 10,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400),
//                         )
//                       else if (pageIndex != 0)
//                         Text(
//                           listmoduleDetails![0].customModuleName,
//                           style: TextStyle(
//                               color: black_1,
//                               fontSize: 10,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400),
//                         )
//                     ],
//                   )),
//                 ),
//               ],
//             ),
//           ),

//           if (pages.length == 2) ...[
//             bottomMenus_2(),
//             // bottomMenus_4(),
//           ],

//           if (pages.length == 3) ...[
//             bottomMenus_2(),
//             bottomMenus_3(),
//             bottomMenus_4(),
//           ],

//           if (pages.length == 4) ...[
//             bottomMenus_2(),
//             bottomMenus_3(),
//             bottomMenus_4(),
//             // bottomMenus_5(),
//           ],
//           if (pages.length > 4) ...[
//             bottomMenus_2(),
//             bottomMenus_3(),
//             bottomMenus_4(),
//             bottomMenus_5(),
//           ],

//           // bottomMenu_5(),
//           // pages.length==2? bottomMenus_2() : Container(),
//           // pages.length==3? bottomMenus_2() : Container(),
//           //
//           // if(pages.length == 2)
//           //   bottomMenus_2(),
//           // if(pages.length == 3)
//           //   bottomMenus_2(),
//           //   bottomMenus_3(),
//           // if(pages.length==4)

//           // bottomMenus_5
//           // InkWell(
//           //   onTap: () {
//           //     // showMenus();
//           //     Navigator.push(
//           //         context,
//           //         MaterialPageRoute(
//           //             builder: (context) =>
//           //                 MenuScreen(title: "Menu", pic: _profile_pic!)));
//           //     _loadCounter();
//           //   },
//           //   child: Column(
//           //     children: [
//           //       SizedBox(height: 10),
//           //       Image.asset("lib/assets/images/menu.png"),
//           //       SizedBox(height: 5),
//           //       Text(
//           //         "Menu",
//           //         style: TextStyle(
//           //             color: black_1,
//           //             fontSize: 10,
//           //             fontFamily: 'Inter',
//           //             fontWeight: FontWeight.w400),
//           //       )
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }

//   Widget bottomMenus_3() {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           pageIndex = 2;
//           _loadCounter();
//         });
//       },
//       child: Column(
//         children: [
//           bottomMenus_image(2),

//           // SizedBox(
//           //   height: 40,
//           //   child: pageIndex == 2
//           //       ? new Image.asset(
//           //     'lib/assets/images/clubs.png',
//           //     color: bottomSelectedMenuColor,
//           //   )
//           //       : new Image.asset(
//           //     'lib/assets/images/clubs.png',
//           //     color: black_1,
//           //   ),
//           // ),
//           Text(
//             listmoduleDetails!.length > 0
//                 ? listmoduleDetails![2].customModuleName
//                 : "",
//             style: TextStyle(
//                 color: pageIndex != 2 ? black_1 : bottomSelectedMenuColor,
//                 fontSize: 10,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w400),
//           )
//         ],
//       ),
//     );
//   }

//   Widget bottomMenus_2() {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           pageIndex = 1;
//           _loadCounter();
//         });
//       },
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             bottomMenus_image(1),
//             Text(
//               listmoduleDetails!.length > 0
//                   ? listmoduleDetails![1].customModuleName
//                   : "",
//               style: TextStyle(
//                   color: pageIndex != 1 ? black_1 : bottomSelectedMenuColor,
//                   fontSize: 10,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget bottomMenus_image(int index) {
//     String assetValues = "";

//     if (listmoduleDetails![index].moduleToken == "community") {
//       assetValues = "lib/assets/images/community_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "coupons") {
//       assetValues = "lib/assets/images/coupon_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "scoringsystem") {
//       assetValues = "lib/assets/images/scoreSystem_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "scoring-leaderboard") {
//       assetValues = "lib/assets/images/leaderboard_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "members") {
//       assetValues = "lib/assets/images/member_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "events") {
//       assetValues = "lib/assets/images/events_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "imagegallery") {
//       assetValues = "lib/assets/images/imagegallery_icon.png";
//     } else if (listmoduleDetails![index].moduleToken == "settings") {
//       assetValues = "lib/assets/images/menu.png";
//     } else {
//       assetValues = "lib/assets/images/events_icon.png";
//     }

//     return SizedBox(
//       height: 40,
//       child: pageIndex == index
//           ? new Image.asset(
//               assetValues,
//               color: bottomSelectedMenuColor,
//               height: 30,
//               width: 30,
//             )
//           : new Image.asset(
//               assetValues,
//               color: black_1,
//               height: 30,
//               width: 30,
//             ),
//     );
//   }

//   Widget bottomMenus_4() {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           pageIndex = 3;
//           _loadCounter();
//         });
//       },
//       child: Column(
//         children: [
//           bottomMenus_image(3),

//           // SizedBox(
//           //   height: 40,
//           //   child: pageIndex == 3
//           //       ? new Image.asset(
//           //     'lib/assets/images/coupon_ic.png',
//           //     color: bottomSelectedMenuColor,
//           //     height: 30,
//           //     width: 30,
//           //   )
//           //       : new Image.asset(
//           //     'lib/assets/images/coupon_ic.png',
//           //     color: black_1,
//           //     height: 30,
//           //     width: 30,
//           //   ),
//           // ),
//           Text(
//             listmoduleDetails!.length > 0
//                 ? listmoduleDetails![3].customModuleName
//                 : "",
//             style: TextStyle(
//                 color: pageIndex != 3 ? black_1 : bottomSelectedMenuColor,
//                 fontSize: 10,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w400),
//           )
//         ],
//       ),
//     );
//   }

//   Widget bottomMenus_5() {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           pageIndex = 4;
//           _loadCounter();
//         });
//       },
//       child: Column(
//         children: [
//           bottomMenus_image(4),

//           // SizedBox(
//           //   height: 40,
//           //   child: pageIndex == 3
//           //       ? new Image.asset(
//           //     'lib/assets/images/coupon_ic.png',
//           //     color: bottomSelectedMenuColor,
//           //     height: 30,
//           //     width: 30,
//           //   )
//           //       : new Image.asset(
//           //     'lib/assets/images/coupon_ic.png',
//           //     color: black_1,
//           //     height: 30,
//           //     width: 30,
//           //   ),
//           // ),
//           Text(
//             listmoduleDetails!.length > 0
//                 ? listmoduleDetails![4].customModuleName
//                 : "",
//             style: TextStyle(
//                 color: pageIndex != 4 ? black_1 : bottomSelectedMenuColor,
//                 fontSize: 10,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w400),
//           )
//         ],
//       ),
//     );
//   }

//   void CreateFeedMenus() {
//     showModalBottomSheet(
//         shape: const RoundedRectangleBorder(
//           // <-- SEE HERE
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(30.0),
//           ),
//         ),
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             margin: EdgeInsets.only(right: 20, left: 20, top: 15),
//             padding: EdgeInsets.only(top: 45, bottom: 46),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (_) => FeedPostScreen()));
//                     },
//                     child: Container(
//                       height: 105,
//                       width: 105,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             //color of shadow
//                             spreadRadius: 5,
//                             //spread radius
//                             blurRadius: 7,
//                             // blur radius
//                             offset: Offset(0, 2), // changes position of shadow
//                             //first paramerter of offset is left-right
//                             //second parameter is top to down
//                           ),
//                           //you can set more BoxShadow() here
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset("lib/assets/images/createpost.png"),
//                           Text("Create"),
//                           Text("Post")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     width: 105,
//                     height: 105,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       //border corner radius
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2), //color of shadow
//                           spreadRadius: 5, //spread radius
//                           blurRadius: 7, // blur radius
//                           offset: Offset(0, 2), // changes position of shadow
//                           //first paramerter of offset is left-right
//                           //second parameter is top to down
//                         ),
//                         //you can set more BoxShadow() here
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset("lib/assets/images/createjob.png"),
//                         Text("Create"),
//                         Text("Job")
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (_) => CreateCommunity()));
//                     },
//                     child: Container(
//                       width: 105,
//                       height: 105,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         //border corner radius
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             //color of shadow
//                             spreadRadius: 5,
//                             //spread radius
//                             blurRadius: 7,
//                             // blur radius
//                             offset: Offset(0, 2), // changes position of shadow
//                           ),
//                           //you can set more BoxShadow() here
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset("lib/assets/images/createcommunity.png"),
//                           Text("Create"),
//                           Text("Community")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   void showMenus() {
//     double height = MediaQuery.of(context).size.height;

//     showModalBottomSheet(
//         isScrollControlled: true,
//         constraints: BoxConstraints(
//           maxHeight: height - 200,
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(30.0),
//           ),
//         ),
//         context: context,
//         builder: (BuildContext bc) {
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: settingsModuleDetails!.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       if (index == settingsModuleDetails!.length - 1) {
//                         return Container(
//                             child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => JoinCommunity()));

//                                 // Navigator.of(context).push(
//                                 //     MaterialPageRoute(builder: (context) => MyCommunityMT()));
//                               },
//                               child: Container(
//                                   height: 40,
//                                   alignment: Alignment.center,
//                                   margin: EdgeInsets.only(left: 30),
//                                   child: Row(children: [
//                                     SizedBox(width: 5),
//                                     Image.asset(
//                                         'lib/assets/images/switch_acc_ic.png'),
//                                     SizedBox(width: 15),
//                                     Text(
//                                       'Switch Community',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontFamily: "Inter",
//                                         fontWeight: FontWeight.w500,
//                                         letterSpacing: 0.1,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ])),
//                               // child: Divider(
//                               //   height: 1,
//                               //   color: grey_1,
//                             ),
//                             Divider()
//                           ],
//                         ));
//                       }
//                       index += 1;
//                       return settingsModuleDetails![index].customModuleName ==
//                                   'Home' ||
//                               settingsModuleDetails![index].customModuleName ==
//                                   'Feeds' ||
//                               settingsModuleDetails![index].hasDisplayMenu != 1
//                           ? Container()
//                           : Column(children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               settingsModuleDetails![index].hasDisplayMenu == 1
//                                   ? InkWell(
//                                       onTap: () {
//                                         // Create a separate screen for menu

//                                         // menu_ScreenNavigation(
//                                         //     settingsModuleDetails![index]
//                                         //         .moduleToken,
//                                         //     settingsModuleDetails![index]
//                                         //         .customModuleName);
//                                       },
//                                       child: Container(
//                                           height: 40,
//                                           // color: Colors.grey,
//                                           alignment: Alignment.center,
//                                           margin: index == 0
//                                               ? EdgeInsets.only(
//                                                   top: 10, left: 30)
//                                               : EdgeInsets.only(left: 30),
//                                           child: Row(children: [
//                                             SizedBox(width: 5),
//                                             Image.asset(settingsModuleDetails![index]
//                                                         .moduleToken ==
//                                                     'scoringsystem'
//                                                 ? 'lib/assets/images/scoreSystem_icon.png'
//                                                 : settingsModuleDetails![index]
//                                                             .moduleToken ==
//                                                         "scoring-leaderboard"
//                                                     ? 'lib/assets/images/scoreleader_icon.png'
//                                                     : settingsModuleDetails![index]
//                                                                 .moduleToken ==
//                                                             "politicalfundraising"
//                                                         ? 'lib/assets/images/fundraising_icon.png'
//                                                         : settingsModuleDetails![
//                                                                         index]
//                                                                     .moduleToken ==
//                                                                 "coupons"
//                                                             ? 'lib/assets/images/coupon_icon.png'
//                                                             : settingsModuleDetails![index]
//                                                                         .moduleToken ==
//                                                                     "events"
//                                                                 ? 'lib/assets/images/events_icon.png'
//                                                                 : settingsModuleDetails![index]
//                                                                             .moduleToken ==
//                                                                         "imagegallery"
//                                                                     ? 'lib/assets/images/imagegallery_icon.png'
//                                                                     : settingsModuleDetails![index].moduleToken ==
//                                                                             "tournaments"
//                                                                         ? 'lib/assets/images/scoring_icon.png'
//                                                                         : settingsModuleDetails![index].moduleToken == 'settings'
//                                                                             ? 'lib/assets/images/setting.png'
//                                                                             : settingsModuleDetails![index].moduleToken == 'noticeboard'
//                                                                                 ? 'lib/assets/images/Menu_NoticeBoardIcon.png'
//                                                                                 : settingsModuleDetails![index].moduleToken == 'polls'
//                                                                                     ? 'lib/assets/images/Menu_PollsIcon.png'
//                                                                                     : settingsModuleDetails![index].moduleToken == 'videogallery'
//                                                                                         ? 'lib/assets/images/Menu_videogallery.png'
//                                                                                         : settingsModuleDetails![index].moduleToken == 'quest'
//                                                                                             ? 'lib/assets/images/Menu_Question.png'
//                                                                                             : 'lib/assets/images/toprofile_ic.png'),
//                                             SizedBox(width: 15),
//                                             Text(
//                                               settingsModuleDetails![index]
//                                                   .customModuleName,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                 fontSize: 16.0,
//                                                 fontFamily: "Inter",
//                                                 fontWeight: FontWeight.w500,
//                                                 letterSpacing: 0.1,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ])),
//                                       // child: Divider(
//                                       //   height: 1,
//                                       //   color: grey_1,
//                                     )
//                                   : Container(),
//                               Divider()
//                             ]);
//                     }),
//               ),
//             ],
//           );
//         });
//   }

//   void getModuleDatas() async {
//     String? versionModel = await getAppJsonData();
//     Map<String, dynamic> user = jsonDecode(versionModel!);
//     VersionDataModel versionDataModel = VersionDataModel.fromJson(user);
//     // String? bottomSelectedMenu = versionDataModel.data!.primaryColorCodeHexa!;
//     // String colorCode = bottomSelectedMenu.replaceAll("#", "").trim();
//     // bottomSelectedMenuColor = Color(int.parse("0xff${colorCode}"));
//     for (int i = 0; i < versionDataModel.data!.moduleDetails!.length; i++) {
//       // To set the community in post feeds page
//       if (versionDataModel.data!.moduleDetails![i].moduleToken == "community") {
//         saveCommunityName(
//             versionDataModel.data!.moduleDetails![i].customModuleName);
//       }

//       if (versionDataModel.data!.moduleDetails![i].mobileAppFixedMenu == 1 &&
//           versionDataModel.data!.moduleDetails![i].status == 1) {
//         listmoduleDetails!.add(versionDataModel.data!.moduleDetails![i]);
//       } else {
//         if (versionDataModel.data!.moduleDetails![i].status == 1) {
//           if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//               "profile-username") {
//           } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//               "referral") {
//           } else {
//             settingsModuleDetails!
//                 .add(versionDataModel.data!.moduleDetails![i]);
//           }
//         }

//         if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "profile-work") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "profile-education") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "profile-college") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "profile-username") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "profile-deactivate") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "referral") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "language") {
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "feeds") {
//           listmoduleDetails!.add(versionDataModel.data!.moduleDetails![i]);
//         } else if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//             "settings") {
//           listmoduleDetails!.add(versionDataModel.data!.moduleDetails![i]);
//         }
//       }

//       // if (versionDataModel.data!.moduleDetails![i].moduleToken ==
//       //     "settings") {
//       //   listmoduleDetails!.add(versionDataModel.data!.moduleDetails![i]);
//       // }
//     }

//     listmoduleDetails!.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

//     for (int i = 0; i < listmoduleDetails!.length; i++) {
//       print("moduleDetails:" + listmoduleDetails![i].moduleName);

//       moduleCheck(
//           listmoduleDetails![i].moduleToken, listmoduleDetails![i].moduleName);
//     }

//     settingsModuleDetails!.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

//     setState(() {
//       _loading = false;
//     });
//   }

//   Widget bottomMenu_5() {
//     return InkWell(
//       onTap: () {
//         pageIndex = 4;
//         _loadCounter();
//       },
//       child: Column(
//         children: [
//           SizedBox(height: 10),
//           Image.asset("lib/assets/images/menu.png"),
//           SizedBox(height: 5),
//           Text(
//             "Menu",
//             style: TextStyle(
//                 color: black_1,
//                 fontSize: 10,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w400),
//           )
//         ],
//       ),
//     );
//   }

//   // Menu List Items Navigation
//   // void menu_ScreenNavigation(String token, String moduleName) {
//   //   // if (token == "careers") {
//   //   print(moduleName);
//   //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//   //     switch (token) {
//   //       case 'careers':
//   //         return CareerScreenPage();
//   //       case 'coupons':
//   //         return NewCouponsPage(module_bottom_status: 0);
//   //       case 'settings':
//   //         return SettingsAndPrivacyScreen(title: moduleName);
//   //       case 'scoringsystem':
//   //         return WalletPage(title: moduleName, bottom_module_status: 0);
//   //       case 'profile':
//   //         return UpdatedMyProfile();
//   //       case 'switchTenant':
//   //         return MyCommunityMT();
//   //       case 'events':
//   //         return EventsList(title: moduleName, bottom_module_status: 0);
//   //       case 'politicalfundraising':
//   //         return FundRaiserHome(title: moduleName);
//   //       case 'scoring-leaderboard':
//   //         return LeaderBoardDashboard(
//   //             customModuleName: moduleName, bottom_menu_status: 0);
//   //       // return OngoingEvent(
//   //       //   title: moduleName,
//   //       // );
//   //       case 'imagegallery':
//   //         return GalleryDashBoard(title: moduleName);
//   //       case 'members':
//   //         return DirectoryScreen(
//   //           customModuleName: moduleName,
//   //           bottom_menu_status: 0,
//   //         );
//   //       case 'community':
//   //         return CommunityDashboardPage(
//   //         title: moduleName,
//   //         bottom_module_status: 0,
//   //         );
//   //       // ClubsScreen(
//   //       //   customModuleName: moduleName,
//   //       //   bottom_menu_status: 0,
//   //       // );
//   //       case 'tournaments':
//   //         return TournamentsDashBoardPage(
//   //             title: moduleName, bottom_module_status: 0);
//   //       case 'noticeboard':
//   //         return NoticeboardList(title: moduleName, bottom_module_status: 0);
//   //       case 'polls':
//   //         return PollsDashboardPage(title: moduleName, bottom_module_status: 0);
//   //       // return OpenPollPage();
//   //       case 'videogallery':
//   //         return VideoListPage(title: moduleName, bottom_module_status: 0);
//   //       case 'quest':
//   //         return QuestQuestionPage();
//   //
//   //       default:
//   //         return ClubsScreen(
//   //           customModuleName: moduleName,
//   //         );
//   //     }
//   //   })).then((value) => setState(() {
//   //         print("page index" + pageIndex.toString());
//   //       }));
//   // }

//   void notification_ScreenNavigation(String token, FeedModel respModel) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       switch (token) {
//         case 'post':
//           return FeedDetailPage(productDetailsObj: respModel, callBack);
//         case 'comments':
//           return FeedDetailPage(productDetailsObj: respModel, callBack);
//         default:
//           return FeedDetailPage(productDetailsObj: respModel, callBack);
//       }
//     }));
//   }

//   void makeFeedsDetailsPage(String feedId) async {
//     String? accessToken = await getAccessToken();
//     String? memberId = await getMemberID();
//     Map dict = {
//       "token": accessToken,
//       "member_id": memberId,
//       "community": "",
//       "filter_member": "",
//       "page": 1,
//       "page_limit": 5,
//       "archive_status": 0
//     };
//     String bodyStr = json.encode(dict);

//     loadingGauge.showLoader(context);

//     dynamic responseJson = await MakeAPI()
//         .postApiCallMain(ConstantsApi.feedListURL + "/" + feedId, bodyStr);
//     FeedModel respModal = FeedModel();

//     if (responseJson != null) {
//       respModal = FeedModel.fromJson(responseJson);
//       loadingGauge.hideLoader();
//       if (respModal.status!.toLowerCase() == "success") {
//         notification_ScreenNavigation("post", respModal);
//       } else {}
//     }
//     ;
//   }

//   navigationTo_UpdateProfile() {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => UpdatedMyProfile()))
//         .then((value) {
//       _loadCounter();
//     });
//   }

//   void makePollListAPICall(int page) async {
//     String? token = await getAccessToken();
//     String? userId = await getMemberID();
//     String? openPollsStatus = await getOpenPollsView();

//     Map dict = {
//       "token": token,
//       "member_id": userId,
//       "page": page,
//       "keyword": ""
//     };

//     print(dict);
//     print(ConstantsApi.openPolls);
//     String bodyStr = json.encode(dict);
//     dynamic openPollsList =
//         await MakeAPI().postApiCallMain(ConstantsApi.openPolls, bodyStr);
//     PollsModel pollsModelMain = PollsModel.fromJson(openPollsList);

//     if (pollsModelMain.totalCount! > 0) {
//       if (openPollsStatus == "0") {
//         saveOpenPollsView("1");
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => OpenPollPage(
//                   totalCount: pollsModelMain.totalCount,
//                 )));
//       }
//     }
//   }
// }
