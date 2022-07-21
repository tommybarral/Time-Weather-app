import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/Home-screen';

  Widget neumorphismContainer(double height, double width, Widget? child) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade500, offset: const Offset(4, 4), blurRadius: 15, spreadRadius: 1),
            const BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 15, spreadRadius: 1),
          ]
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Icon(Icons.search, color: Colors.black, size: 25,),
            SizedBox(width: 15,),
            Icon(Icons.more_vert, color: Colors.black, size: 25),
            SizedBox(width: 15,),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              neumorphismContainer(250, 375,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('California', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                    Text('30°', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w300),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.28,),
                        Icon(Icons.keyboard_arrow_up),
                        Text('31°C', style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
                        SizedBox(width: 20,),
                        Icon(Icons.keyboard_arrow_down),
                        Text('19°C', style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.28,),
                      ],
                    ),
                    Text('Clear Sky', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w300, letterSpacing: 1.5),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, bottom: 4.0),
                child: neumorphismContainer(
                  120, MediaQuery.of(context).size.width * 1,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: neumorphismContainer(
                  250, MediaQuery.of(context).size.width * 1,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
