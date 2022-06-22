import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_squadl/models/universities_model.dart';
import 'package:task_squadl/providers/home_page_provider.dart';
import 'package:task_squadl/screens/details_page_screen.dart';
import 'package:task_squadl/services/navigation_services.dart';
import 'package:task_squadl/services/screen_services.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomePageProvider>(context, listen: false).getUnivList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, HomePageProvider homePageProvider, snapshot) {
      return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.950),
          appBar: AppBar(
            title: const Text('Squadl Task'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(child: _autoCompleteName(homePageProvider)),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: homePageProvider.teamMatesModelList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black12)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: ListTile(
                                title: Text(
                                  homePageProvider
                                      .teamMatesModelList[index].name!,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          onTap: () {
                            homePageProvider.chosenIndex = index;
                            NavigationServices.changeScreen(
                                context, const DetailsPageScreen());
                          },
                        ),
                      );
                    }),
              ),
            ],
          ));
    });
  }

  Widget _autoCompleteName(HomePageProvider homePageProvider) {
    return RawAutocomplete<UniversitiesModel>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isNotEmpty) {
          return homePageProvider.teamMatesModelList
              .where((UniversitiesModel val) => val.name!
                  .toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase()))
              .toList();
        } else {
          return [];
        }
      },
      textEditingController: homePageProvider.autoComController,
      focusNode: homePageProvider.autoCompleteFocusNode,
      displayStringForOption: (UniversitiesModel option) => option.name!,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          controller: homePageProvider.autoComController,
          focusNode: homePageProvider.autoCompleteFocusNode,
          decoration: const InputDecoration(hintText: 'Search'),
        );
      },
      onSelected: (UniversitiesModel selection) {},
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<UniversitiesModel> onSelected,
          Iterable<UniversitiesModel> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              child: Container(
                width: ScreenServices.getScreenWidth(context) * 0.95,
                height: 38.0 * (options.length),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 5)
                    ]),
                child: Scrollbar(
                  thickness: 0,
                  interactive: true,
                  radius: const Radius.circular(4),
                  controller: homePageProvider.autoCompleteScrollCtlr,
                  child: ListView.builder(
                    controller: homePageProvider.autoCompleteScrollCtlr,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final UniversitiesModel option = options.elementAt(index);

                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                          homePageProvider.chosenIndex =
                              homePageProvider.teamMatesModelList.indexWhere(
                                  (element) => element.name == option.name);
                          NavigationServices.changeScreen(
                              context, const DetailsPageScreen());
                        },
                        child: ListTile(
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -4),
                          title: Text(
                            option.name!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
