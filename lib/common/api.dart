import 'package:http/http.dart' as http;

class TrafficDataService {
  String baseUrl = 'http://darulxadith.herokuapp.com/api/classe-list/';

  Future<List> getUsersProfile() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print('fdsfsdfsdfsd');
      print(e);
    }
    return [];
  }

  fixTheFine(theCarFine) {
    theCarFine['fixed'] = true;
  }

  bool paidTheMoney(theCarFine, userNumber) {
    theCarFine['paided'] = true;
    // double fineMoney=pظظ theCarFine['price'].toString().split('\$')[0]
    theCarFine['fineMoney'] = 0;
    return true;
  }
}
