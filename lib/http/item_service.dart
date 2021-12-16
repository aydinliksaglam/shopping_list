import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoppingg_list1/model/item.dart';

class ItemService{
  final String _serviceUrl = "http://kesali-shopping.herokuapp.com/item";

  Future<List<Item>> fetchItems() async{
    final response= await http.get(Uri.parse(_serviceUrl));

    if(response.statusCode==200){ //herşey yolunda gittiyse statuscode=200
      Iterable items = json.decode(response.body);

      return items.map((item) =>Item.fromJson(item)).toList(); //json objesini dart objesine çevirme
    }else{
      throw Exception("Bir şeyler yanlış gitti");
    }
  }
  //addItem servise veri gönderir.

  Future<Item> addItem(String itemJson) async {
    final response = await http.post(Uri.parse(_serviceUrl), headers: {
      'content-type': 'application/json' //sunucuya formdan gelen datanın json formatında olduğunun bilgisini gösterir.
    }, body: json);

    if (response.statusCode == 201) { //her şey yolunda gitti, sunucu item'ı database'e kaydetti
      Map item = json.decode(response.body);

      return Item.fromJson(item);
    } else {
      throw Exception("Bir şeyler yanlış gitti");
    }
  }
}