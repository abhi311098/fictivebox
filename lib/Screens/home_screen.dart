import 'package:fictivebox/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/constant_color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider _homeProvider;

  var w, h;

  apiCall(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      _homeProvider = Provider.of<HomeProvider>(context, listen: false);
      _homeProvider.homeProviderData(context);
    });
  }

  List? aa;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    apiCall(context);
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (_, data, __) => data.dataStatus
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.data['features'].length,
                  itemBuilder: (context, index) {
                    print("qqqqq ${DateTime.fromMillisecondsSinceEpoch(data.data['features'][index]['properties']['time'])
                        .toIso8601String()
                        .split("T0")
                        .first}");
                    return ListTile(
                      title: Text(DateTime.fromMillisecondsSinceEpoch(data.data['features'][index]['properties']['time'])
                          .toIso8601String()
                          .split("T0")
                          .first,),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
