import 'package:data_band/Screens/EmployeeHomePage.dart';
import 'package:data_band/Screens/LoginPage.dart';
import 'package:data_band/Screens/TaskDetails.dart';
import 'package:data_band/Screens/TaskerHomePage.dart';

class Routs {
  static var routs  = {
     
        
        '/TaskDetails': (context) => TaskDetails(),
        '/EmployeeHomePage': (context) => EmployeeHomePage(),
        '/TaskerHomePage': (context) => TaskerHomePage(),
        '/LoginPage': (context) => LoginPage(),
     
  };
}