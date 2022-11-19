import 'package:covid_tracker/View/countries_list_screen.dart';
import 'package:covid_tracker/models/world_state_model.dart';
import 'package:covid_tracker/services/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    FetchData fetchData = FetchData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Covid 19 Tracker'),
        ),
        body: FutureBuilder(
          future: fetchData.fetchWorldState(),
          builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // print('value: ${snapshot.data?.cases}');
              return SpinKitFadingCircle(
                color: Colors.white,
                size: 50,
                controller: _controller,
              );
            } else {
              final data = listMaker(snapshot.data);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    PieChart(
                      chartRadius: size.height * .25,
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValues: false,
                        showChartValuesInPercentage: true,
                      ),
                      // chartType: ChartType.ring,
                      dataMap: {
                        'Recovered': snapshot.data!.recovered!.toDouble(),
                        'Active': snapshot.data!.active!.toDouble(),
                        'Deaths': snapshot.data!.deaths!.toDouble(),
                      },
                      animationDuration: const Duration(milliseconds: 1200),
                      colorList: colorList,
                    ),
                    Container(
                      height: size.height * .34,
                      margin: const EdgeInsets.symmetric(vertical: 8),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesListScreen(),));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.09),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Trace Countries',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.7),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> listMaker(dynamic? data) {
  return [
    {'title': 'Cases', 'value': data!.cases!.toInt()},
    {'title': 'Recoverd', 'value': data.recovered!.toInt()},
    {'title': 'Active', 'value': data.active!.toInt()},
    {'title': 'Critical', 'value': data.critical!.toInt()},
    {'title': 'Deaths', 'value': data.deaths!.toInt()}
  ];
}

class ReusableRow extends StatelessWidget {
  final String title;
  final int value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
