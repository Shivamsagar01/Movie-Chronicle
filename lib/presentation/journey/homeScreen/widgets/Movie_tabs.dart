import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/src/client.dart';

import 'package:movie_chronicle/presentation/journey/homeScreen/widgets/Movie_List_Tile.dart';

import '../../../../data/core/api_client.dart';
import '../../../../data/data_sources/movie_remote_data_sources.dart';
import '../../../../data/models/movie_model.dart';



class MovieTabsAndContent extends StatefulWidget {
  @override
  _MovieTabsAndContentState createState() => _MovieTabsAndContentState();
}

class _MovieTabsAndContentState extends State<MovieTabsAndContent>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late Future<List<MovieModel>?> popularMovies;
  late Future<List<MovieModel>?> nowMovies;
  late Future<List<MovieModel>?> soonMovies;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    ApiClient apiClient = ApiClient(Client() as Client);
    MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
    popularMovies = dataSource.getPopular();
    soonMovies = dataSource.getComingSoon();
    nowMovies = dataSource.getPlayingNow();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TabBar(dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.red,
              indicatorColor: Colors.white,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.8, color: Colors.red),
                insets: EdgeInsets.symmetric(horizontal: 0.0, vertical: 6),
              ),
              isScrollable: true,
              labelStyle: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold),
              // TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
              controller: _tabController,
              tabs: [
                Tab(text: "Popular"),
                Tab(text: "Now"),
                Tab(text: "Soon"),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              SizedBox(
                  child: FutureBuilder(
                    future: popularMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return const Center(
                          child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                        );
                      }else if(snapshot.hasData){
                        return MovieListTile(snapshot: snapshot,);
                      }else{
                        return const Center(child: CircularProgressIndicator(color: Colors.white),);
                      }
                    },
                  )
              ),
              SizedBox(
                  child: FutureBuilder(
                    future: nowMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                        );
                      }else if(snapshot.hasData){
                        return MovieListTile(snapshot: snapshot,);
                      }else{
                        return Center(child: CircularProgressIndicator(color: Colors.white),);
                      }
                    },
                  )
              ),
              SizedBox(
                  child: FutureBuilder(
                    future: soonMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text('Unable to load Movies, Please Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                        );
                      }else if(snapshot.hasData){
                        return MovieListTile(snapshot: snapshot,);
                      }else{
                        return Center(child: CircularProgressIndicator(color: Colors.white),);
                      }
                    },
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
