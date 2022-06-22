import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_squadl/providers/home_page_provider.dart';

class DetailsPageScreen extends StatefulWidget {
  const DetailsPageScreen({Key? key}) : super(key: key);

  @override
  State<DetailsPageScreen> createState() => _DetailsPageScreenState();
}

class _DetailsPageScreenState extends State<DetailsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, HomePageProvider homePageProvider, snapshot) {
      return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('University Name'),
                subtitle: Text(homePageProvider
                    .teamMatesModelList[homePageProvider.chosenIndex].name!),
              ),
              ListTile(
                  title: const Text('Domains'),
                  subtitle: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homePageProvider
                          .teamMatesModelList[homePageProvider.chosenIndex]
                          .domains!
                          .length,
                      itemBuilder: (context, index) {
                        return Text(homePageProvider
                            .teamMatesModelList[homePageProvider.chosenIndex]
                            .domains![index]);
                      })),
              ListTile(
                title: const Text('State'),
                subtitle: Text(homePageProvider
                    .teamMatesModelList[homePageProvider.chosenIndex]
                    .stateProvince!),
              ),
              ListTile(
                title: const Text('Country Code'),
                subtitle: Text(homePageProvider
                    .teamMatesModelList[homePageProvider.chosenIndex]
                    .alphaTwoCode!),
              ),
              ListTile(
                title: const Text('Country'),
                subtitle: Text(homePageProvider
                    .teamMatesModelList[homePageProvider.chosenIndex].country!),
              ),
              ListTile(
                  title: const Text('Web Pages'),
                  subtitle: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homePageProvider
                          .teamMatesModelList[homePageProvider.chosenIndex]
                          .webPages!
                          .length,
                      itemBuilder: (context, index) {
                        return Text(homePageProvider
                            .teamMatesModelList[homePageProvider.chosenIndex]
                            .webPages![index]);
                      })),
            ],
          ),
        ),
      );
    });
  }
}
