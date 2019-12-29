import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  var status;
  String baseUrl = "http://10.0.2.2:8000/api/";

  login(email , password) async{

      Map data = {
        'email': "$email",
        'password': "$password"
      };

      var body = json.encode(data);

      var response = await http.post(baseUrl + 'auth/login',
            headers: {"Content-Type": "application/json","Accept": "application/json"},
            body: body
      );

      status = response.statusCode;

      if(status == 200){
        var user = json.decode(response.body);
        _save(user['access_token']);
      }
  }


    Future<List> devices() async{

        final prefs = await SharedPreferences.getInstance();
        final value= prefs.get('token') ?? 0;

        var response = await http.get(baseUrl+'device',
            headers: {"Authorization": "Bearer "+ value},
        );

        status = response.statusCode;
        if(status == 200){ 
          return json.decode(response.body)['data'];
        }
    }
    



    _save(String token) async{
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
    }

    read() async{
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value= prefs.get(key) ?? 0;
      print(value);
    }

}



        