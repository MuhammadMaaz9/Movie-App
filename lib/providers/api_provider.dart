import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:movieapp/models/model.dart';
import 'package:movieapp/services/services.dart';

class ApiProvider extends ChangeNotifier {
  City city = City(response: []);
  List<City> _movielist = [];
  List<City> get movielist => _movielist;
  bool isLoading = false;

  Future getdata() async {
    isLoading = true;
    notifyListeners();

    city = await ApiServices().getdataa();
    //_movielist = resp;
    isLoading = false;
    notifyListeners();
  }
}
