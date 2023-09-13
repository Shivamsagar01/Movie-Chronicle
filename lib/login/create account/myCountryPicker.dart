import 'package:flutter/material.dart';

class myCountry {
  late final String name;
  late final String code;

  myCountry({required this.name, required this.code});
}

class CountryCodePicker extends StatefulWidget {
  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  List<myCountry> countries = [
    myCountry(name: 'Thailand', code: '+66'),
    myCountry(name: 'Uganda', code: '+256'),
    myCountry(name: 'Indonesia', code: '+62'),
    myCountry(name: 'Peru', code: '+51'),
    myCountry(name: 'Kenya', code: '+254'),
    myCountry(name: 'Saudi Arabia', code: '+966'),
    myCountry(name: 'Egypt', code: '+20'),
    myCountry(name: 'Vietnam', code: '+84'),
    myCountry(name: 'Argentina', code: '+54'),
    myCountry(name: 'Nigeria', code: '+234'),
    myCountry(name: 'India', code: '+91'),
    myCountry(name: 'Morocco', code: '+212'),
    myCountry(name: 'Algeria', code: '+213'),
    myCountry(name: 'Chile', code: '+56'),
    myCountry(name: 'Hong Kong', code: '+852'),
    myCountry(name: 'United Arab Emirates', code: '+971'),
    myCountry(name: 'Colombia', code: '+57'),
    myCountry(name: 'Tanzania', code: '+255'),
    myCountry(name: 'Brazil', code: '+55'),
    myCountry(name: 'Ghana', code: '+233'),
    myCountry(name: 'South Africa', code: '+27'),
    myCountry(name: 'Mexico', code: '+52'),
  ];

  myCountry? selectedCountry;
  TextEditingController searchController = TextEditingController();
  String search = '';

  myCountry? _getMatchingCountry(String query) {
    if (query.isEmpty) {
      return myCountry(name: 'India', code: '+91');
    }

    // query = query.toLowerCase();

    for (var country in countries) {
      if (country.name.contains(query) ||
          country.code.contains(query)) {
        return country;
      }
    }

    return myCountry(name: 'India', code: '+91');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,size: 30,color: Colors.grey.shade500,)),
                  SizedBox(width: 70.0),
                  Text(
                    'Choose your country',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 65, 65, 1),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Center(
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.grey.shade400,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ' Search',
                      hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 17),
                      prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 22,),
                    ),
                    onChanged: (value) {
                      setState(() {
                        search = value.toString();
                        selectedCountry = _getMatchingCountry(value);
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                // color: Colors.green,
                child:  NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      myCountry country = countries[index];
                      late String position = index.toString();
                      if(searchController.text.isEmpty)
                      {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${country.name}',style: TextStyle(color: Colors.white),),
                              Text('${country.code}',style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              selectedCountry = country;
                              searchController.text = '';
                            });
                            Navigator.pop(context,selectedCountry);
                          },
                        );
                      }
                      else if(country.name.toLowerCase().contains(searchController.text.toLowerCase()) ||
                          country.code.toLowerCase().contains(searchController.text.toLowerCase())){
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${country.name}',style: TextStyle(color: Colors.white),),
                              Text('${country.code}',style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              selectedCountry = country;
                              searchController.text = '';
                            });
                            Navigator.pop(context,selectedCountry);
                          },
                        );
                      }
                      else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
