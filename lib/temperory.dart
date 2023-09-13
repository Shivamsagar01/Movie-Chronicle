// ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.345,
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   child: Image.network(
//                     filterQuality: FilterQuality.high,
//                     fit: BoxFit.cover,
//                     '${ApiConstants.BASE_IMAGE_URL}${snapshot.data[itemIndex].posterPath }'
//                   ),
//                 ),
//               )



// Container(
// height: MediaQuery.of(context).size.height * 0.345,
// width: MediaQuery.of(context).size.width * 0.55,
// color: Colors.green,
// ),


//===homeScreen================
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen(Future<List<MovieModel>?> trendingMovies, {Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             MovieAppBar(),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.012,),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text(
//                   'Trending Movies',
//                   style: GoogleFonts.aBeeZee(fontSize: 25,),
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.018,),
//             // Movie_Carousel(),
//             SizedBox(
//                 child: FutureBuilder(
//                   future: trendingMovies,
//                   builder: (context,snapshot){
//                     if(snapshot.hasError){
//                       return Center(
//                         child: Text(snapshot.error.toString()),
//                       );
//                     }else if(snapshot.hasData){
//                       // print('${ApiConstants.BASE_IMAGE_URL}${snapshot.data?[0].posterPath }');
//                       return Movie_Carousel(snapshot: snapshot,);
//                       // Movie_Carousel(snapshot: snapshot,);
//                     }else{
//                       return Center(child: CircularProgressIndicator(),);
//                     }
//                   },
//                 )
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.017,),
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Explore Movies',
//                 style: GoogleFonts.aBeeZee(fontSize: 27,),
//               ),
//             ),
//             Center(
//               child: Container(
//                 height: 3,
//                 width: 150,
//                 color: Colors.red,
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
//             Expanded(
//               child: MovieTabsAndContent(),
//             ),
//             // MovieTextTabs(),
//           ],
//         ),
//       ),
//     );
//   }
// }


//=================movie list tile
// ClipRRect(
// borderRadius: BorderRadius.circular(12),
// child: Container(
// color: Colors.amber,
// height: MediaQuery.of(context).size.height * 0.228,
// width: MediaQuery.of(context).size.width * 0.36,
// ),
// ),


//===========underline
// Padding(
// padding: const EdgeInsets.only(left: 10),
// child: Align(
// alignment: Alignment.topLeft,
// child: Container(
// height: 3,
// width: 200,
// color: Colors.red,
// ),
// ),
// ),


