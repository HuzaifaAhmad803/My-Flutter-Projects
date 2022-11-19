import 'package:covid_tracker/View/country_state_screen.dart';
import 'package:covid_tracker/services/fetch_data.dart';
import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final myBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.grey.shade600));

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FetchData _fetchData = FetchData();
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.grey.shade800,
        // title: TextFormField(
        //   onChanged: (value) {
        //     setState(() {
        //
        //     });
        //   },
        //   controller: _controller,
        //   cursorColor: Colors.grey,
        //   decoration: InputDecoration(
        //     hintText: 'Search by country name',
        //     enabledBorder: myBorder,
        //     focusedBorder: myBorder,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {

                });
              },
              controller: _controller,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: 'Search by country name',
                enabledBorder: myBorder,
                focusedBorder: myBorder,
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: _fetchData.fetchCountriesList(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              List<dynamic> list = [];
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else {
                list.clear();
                String str;
                for(int i = 0; i < snapshot.data!.length; i++){
                  str = snapshot.data![i]['country'];
                  if(_controller.text.isEmpty){
                    list = snapshot.data!;
                  }
                  else if(str.toLowerCase().contains(_controller.text.toLowerCase())){
                    list.add(snapshot.data![i]);
                  }
                }
                if(list.isEmpty){
                  return Center(child: Text('No Results can found.!'));
                }
                else{
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesStateScreen(map: list[index]),));
                      },
                      leading: Image(
                          height: 50,
                          width: 50,
                          image: NetworkImage(
                              list[index]['countryInfo']['flag'])),
                      title: Text(list[index]['country']),
                      subtitle: Text('Cases: ' +
                          list[index]['cases'].toString()),
                    );
                  },);
                }
              }
            },
          ))
        ],
      ),
    );
  }
}
