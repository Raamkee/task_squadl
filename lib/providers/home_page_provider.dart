import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_squadl/models/universities_model.dart';
import 'package:task_squadl/providers/app_provider.dart';
import 'package:task_squadl/services/api_services.dart';

class HomePageProvider with ChangeNotifier {
  late AppProvider appProvider;
  TextEditingController autoComController = TextEditingController();
  ScrollController autoCompleteScrollCtlr = ScrollController();
  FocusNode autoCompleteFocusNode = FocusNode();
  List<UniversitiesModel> teamMatesModelList = [];
  int chosenIndex = 0;

  Future<void> getUnivList(context) async {
    appProvider = Provider.of<AppProvider>(context, listen: false);
    List assignedEmployeesList = [];
    if (teamMatesModelList.isEmpty) {
      if (await appProvider.isInternetAvailable()) {
        List<dynamic> assigedEmployeesResponse = await ApiServices.getMethod(
            'http://universities.hipolabs.com/search?country=India');
        assignedEmployeesList = assigedEmployeesResponse;
        teamMatesModelList = assignedEmployeesList
            .map<UniversitiesModel>((json) => UniversitiesModel.fromJson(json))
            .toList();
      } else {
        appProvider.showSnackBar(context,
            text: 'No Internet', icon: Icons.error_outline);
      }
    }
    notifyListeners();
  }
}
