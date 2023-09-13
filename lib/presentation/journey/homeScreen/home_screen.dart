
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/src/client.dart';
import 'package:movie_chronicle/presentation/journey/homeScreen/widgets/Movie_carousel.dart';
import 'package:movie_chronicle/presentation/journey/homeScreen/widgets/Movie_tabs.dart';
import 'package:movie_chronicle/presentation/journey/homeScreen/widgets/appBar.dart';

import '../../../data/core/api_client.dart';
import '../../../data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_chronicle/presentation/journey/myDrawer/navigtio_drawer.dart';

import '../../../data/models/cast_model.dart';
import '../../../data/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>?> trendingMovies;
  late Future<List<CastModel>?> castData;


  @override
  void initState() {
    super.initState();
    ApiClient apiClient = ApiClient(Client() as Client);
    MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
    trendingMovies = dataSource.getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const navigationDrawer(),
        body: Column(
          children: [
            MovieAppBar(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Trending Movies :',
                  style: GoogleFonts.aBeeZee(fontSize: 25,),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.016,),
            // Movie_Carousel(),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return const Center(
                      child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                    );
                  }else if(snapshot.hasData){
                    return Movie_Carousel(snapshot: snapshot,);
                  }else{
                    return Center(child: CircularProgressIndicator(color: Colors.white),);
                  }
                },
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Explore Movies :',
                  style: GoogleFonts.aBeeZee(fontSize: 27,),
                ),
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Expanded(
              child: MovieTabsAndContent(),
            ),
            // MovieTextTabs(),
         ],
        ),
      ),
    );
  }
}
