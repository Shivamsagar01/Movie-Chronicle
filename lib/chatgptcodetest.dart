// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         backgroundColor: Colors.black,
// //         appBar: AppBar(
// //           title: Text("Movie App"),
// //         ),
// //         body: DefaultTabController(
// //           length: 3,
// //           child: Column(
// //             children: [
// //               Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 30),
// //                   child: TabBar(unselectedLabelColor: Colors.green,labelColor: Colors.red,indicatorColor: Colors.white,
// //                     indicator: UnderlineTabIndicator(
// //                       borderSide: BorderSide(width: 4.0, color: Colors.red),
// //                       insets: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
// //                     ),
// //                     isScrollable: true,
// //                     labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
// //                     tabs: [
// //                       Tab(text: "Popular"),
// //                       Tab(text: "Now"),
// //                       Tab(text: "Soon"),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Expanded(
// //                 child: TabBarView(
// //                   children: [
// //                     MovieListTile(tab: "Popular",items: 1,),
// //                     MovieListTile(tab: "Now",items: 8,),
// //                     MovieListTile(tab: "Soon",items: 3,),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // //
// // // class MovieTextTabs extends StatefulWidget {
// // //   const MovieTextTabs({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<MovieTextTabs> createState() => _MovieTextTabsState();
// // // }
// // //
// // // class _MovieTextTabsState extends State<MovieTextTabs> {
// // //   int _selectedTabIndex = 0;
// // //
// // //   void _selectTab(int index) {
// // //     setState(() {
// // //       _selectedTabIndex = index;
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Center(
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           TextButton(
// // //             onPressed: () => _selectTab(0),
// // //             child: Text(
// // //               'Popular',
// // //               style: GoogleFonts.aBeeZee(
// // //                 fontSize: 25,
// // //                 color: _selectedTabIndex == 0 ? Colors.blue : Colors.red,
// // //               ),
// // //             ),
// // //           ),
// // //           Padding(
// // //             padding: const EdgeInsets.only(left: 15, right: 15),
// // //             child: TextButton(
// // //               onPressed: () => _selectTab(1),
// // //               child: Text(
// // //                 'Now',
// // //                 style: GoogleFonts.aBeeZee(
// // //                   fontSize: 25,
// // //                   color: _selectedTabIndex == 1 ? Colors.blue : Colors.red,
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //           TextButton(
// // //             onPressed: () => _selectTab(2),
// // //             child: Text(
// // //               'Soon',
// // //               style: GoogleFonts.aBeeZee(
// // //                 fontSize: 25,
// // //                 color: _selectedTabIndex == 2 ? Colors.blue : Colors.red,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // class MovieListTile extends StatelessWidget {
// //   final String tab;
// //   final int items;
// //
// //   const MovieListTile({Key? key,required this.items, required this.tab}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // You can modify this section to create the appropriate content for each tab
// //     // For now, I'm just showing the tab name and index
// //     return ListView.builder(
// //       scrollDirection: Axis.horizontal,
// //       physics: BouncingScrollPhysics(),
// //       itemCount: items,
// //       itemBuilder: (context, index) {
// //         return Column(
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.all(8),
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(12),
// //                 child: Container(
// //                   color: Colors.amber,
// //                   height: MediaQuery.of(context).size.height * 0.228,
// //                   width: MediaQuery.of(context).size.width * 0.36,
// //                 ),
// //               ),
// //             ),
// //             Align(
// //               alignment: Alignment.center,
// //               child: Text(
// //                 'Movie $items',
// //                 style: GoogleFonts.aBeeZee(fontSize: 18),
// //               ),
// //             ),
// //             SizedBox(height: MediaQuery.of(context).size.height * 0.005),
// //             Text(
// //               'IMDB: 7.0',
// //               style: GoogleFonts.aBeeZee(fontSize: 18),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Movie App"),
//         ),
//         body: Column(
//           children: [
//             // Content above the tabs
//             Container(
//               height: MediaQuery.of(context).size.height * 0.4,
//               alignment: Alignment.center,
//               child: Center(
//                 child: Text("Content Above Tabs"),
//               ),
//             ),
//             // Tabs and TabBarView
//             Expanded(
//               child: MovieTabsAndContent(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MovieTabsAndContent extends StatefulWidget {
//   @override
//   _MovieTabsAndContentState createState() => _MovieTabsAndContentState();
// }
//
// class _MovieTabsAndContentState extends State<MovieTabsAndContent> with SingleTickerProviderStateMixin {
// TabController? _tabController;
//
// @override
// void initState() {
//   super.initState();
//   _tabController = TabController(length: 3, vsync: this);
// }
//
// @override
// void dispose() {
//   _tabController?.dispose();
//   super.dispose();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       TabBar(
//         controller: _tabController,
//         tabs: [
//           Tab(text: "Popular"),
//           Tab(text: "Now"),
//           Tab(text: "Soon"),
//         ],
//       ),
//       Expanded(
//         child: TabBarView(
//           controller: _tabController,
//           children: [
//             MovieListTile(items: 8),
//             MovieListTile(items: 4),
//             MovieListTile(items: 10),
//           ],
//         ),
//       ),
//     ],
//   );
// }
// }
//
//
//
// class MovieListTile extends StatelessWidget {
//   final int items;
//
//   const MovieListTile({required this.items});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       physics: BouncingScrollPhysics(),
//       itemCount: items,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Container(
//                   color: Colors.amber,
//                   height: MediaQuery.of(context).size.height * 0.228,
//                   width: MediaQuery.of(context).size.width * 0.36,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Movie $index',
//                 style: GoogleFonts.aBeeZee(fontSize: 18),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.005),
//             Text(
//               'IMDB: 7.0',
//               style: GoogleFonts.aBeeZee(fontSize: 18),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
