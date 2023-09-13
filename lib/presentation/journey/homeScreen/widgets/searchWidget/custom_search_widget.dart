import 'package:flutter/material.dart';
import 'package:http/src/client.dart';
import 'package:movie_chronicle/presentation/journey/homeScreen/widgets/searchWidget/searched_movie_tile.dart';

import '../../../../../data/core/api_client.dart';
import '../../../../../data/data_sources/movie_remote_data_sources.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/models/movie_model.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  late Future<List<MovieModel>?> searchMovies;
  String query = '';
  final formKey = GlobalKey<FormState>();
  ApiClient apiClient = ApiClient(Client());
  late MovieRemoteDataSource dataSource;

  @override
  void initState() {
    dataSource = MovieRemoteDataSourceImpl(apiClient);
    searchMovies = dataSource.getSearchedMovie(query);
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,size: 25,)
                ),
                Expanded(
                  child: Container(
                    // margin: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Center(
                      child: TextFormField(
                        key: formKey,
                        onChanged: (value) {
                          query = value;
                        },
                        // autofocus:
                        // movieController.searchedMovies.isEmpty ? true : false,
                        cursorColor:
                        Theme.of(context).primaryTextTheme.bodyLarge?.color,
                        cursorHeight: 18,
                        style: TextStyle(fontSize: 19, color: Colors.white,fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Enter Movie Name',
                          hintStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              FocusScopeNode currentFocus = FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus &&
                                  currentFocus.focusedChild != null) {
                                currentFocus.focusedChild?.unfocus();
                              }
                              // ApiClient apiClient = ApiClient(Client());
                              // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
                              setState(() {
                                searchMovies = dataSource.getSearchedMovie(query);
                              });
                            },
                              icon: Icon(Icons.search,color: Colors.white,size: 25,)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 0),
              child: Text(
                  'Top Results',
                  style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold)
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
                height: double.maxFinite,
                child: FutureBuilder(
                  future: searchMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return const Center(
                        child: Text('Unable to load Movies, PLease Reopen the app',style: TextStyle(color: Colors.red,fontSize: 15),),
                      );
                    }else if(snapshot.hasData){
                      return SearchedMovieTiles(snapshot: snapshot,);
                    }else{
                      return Center(child: CircularProgressIndicator(color: Colors.white,),);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}



