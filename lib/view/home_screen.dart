import 'package:flutter/material.dart';
import '../models/constants.dart';
import '../constants.dart';
import '../models/network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/Home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = '';
  int temperature = 0;
  double temp_min = 0.00;
  double temp_max = 0.00;
  String descrip = '';
  int humidity = 0;

  Future weatherMapData(String city) async {
    Network networkHelper = Network('${openWeatherMapUrl}q=$city&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getMapFromOpenWeather();
    setState(() {
      cityName = weatherdata['name'];
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      temp_min = weatherdata['main']['temp_min'];
      temp_max = weatherdata['main']['temp_max'];
      descrip = weatherdata['weather'][0]['description'];
      humidity = weatherdata['main']['humidity'];
    });
  }

  @override
  void initState() {
    weatherMapData(cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    weatherMapData(cityName);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                neumorphismContainer(50, MediaQuery.of(context).size.width * 0.9, TextField(
                  decoration: const InputDecoration(
                    labelText: 'City',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onSubmitted: (val) {
                    setState(() {
                      cityName = val;
                    });
                  },
                ),),
                neumorphismContainer(250, 375,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text((cityName == '') ? 'enter a city' : cityName.toLowerCase(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                      Text('$temperature°C', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w300),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                          const Icon(Icons.keyboard_arrow_down),
                          Text(temp_min.toString(), style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
                          const SizedBox(width: 20,),
                          const Icon(Icons.keyboard_arrow_up),
                          Text(temp_max.toString(), style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                        ],
                      ),
                      Text(descrip, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w300, letterSpacing: 1.5),),
                    ],
                  ),
                ),
                neumorphismContainer(
                  120, MediaQuery.of(context).size.width * 1,
                  /*
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 12.0, bottom: 4.0, right: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('1 PM'),
                            Icon(Icons.wb_sunny),
                            Text('30 °C'),
                            Row(
                              children: [
                                Icon(Icons.download_rounded),
                                Text('0%'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  */
                  const Center(child: Text('You can pay for unlock this feature', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
                ),
                neumorphismContainer(
                  250, MediaQuery.of(context).size.width * 1,
                  /*
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Monday', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                            Icon(Icons.wb_sunny),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                            Icon(Icons.pin_drop),
                            Text('0%'),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                            Text('31°C / 21°C'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  */
                  const Center(child: Text('You can pay for unlock this feature', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
