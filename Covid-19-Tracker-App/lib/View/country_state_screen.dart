import 'package:covid_tracker/View/home_screen.dart';
import 'package:flutter/material.dart';

class CountriesStateScreen extends StatefulWidget {
  final Map map;
  CountriesStateScreen(
      {Key? key,
      this.map = const {
        'country': 'Pakistan',
        'countryInfo': {'flag': 'https://disease.sh/assets/img/flags/pk.png',},
        'cases': 50,
        'recovered': 30,
        'active': 12,
        'deaths': 8,
        'critical': 4
      }})
      : super(key: key);

  @override
  State<CountriesStateScreen> createState() => _CountriesStateScreenState();
}

class _CountriesStateScreenState extends State<CountriesStateScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Map> data = [
      {'title': 'Cases', 'value': widget.map['cases']},
      {'title': 'Recovered', 'value': widget.map['recovered']},
      {'title': 'Active', 'value': widget.map['active']},
      {'title': 'Critical', 'value': widget.map['critical']},
      {'title': 'Deaths', 'value': widget.map['deaths']},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.map['country']),
        // leading: Image.network(widget.map['countryInfo']['flag']),
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.15,),
          // Image(image: NetworkImage(widget.map['countryInfo']['flag']),),
          // Text(widget.map['country'], style: TextStyle(
          //   fontSize: 22,
          //
          // ),),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: size.height * .34,
                // margin: const EdgeInsets.symmetric(vertical: 8),
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade700,
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ReusableRow(
                        title: data[index]['title'],
                        value: data[index]['value']);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.map['countryInfo']['flag']),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
