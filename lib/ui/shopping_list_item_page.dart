import 'package:flutter/material.dart';
import 'package:shoppingg_list1/http/item_service.dart';
import 'package:shoppingg_list1/model/item.dart';

class ShoppingListItemPage extends StatefulWidget {
  //const ShoppingListItemPage({Key? key}) : super(key: key);

  @override
  _ShoppingListItemPageState createState() => _ShoppingListItemPageState();
}

class _ShoppingListItemPageState extends State<ShoppingListItemPage> {
  late ItemService _itemService;

  @override
  void initState(){
    _itemService = ItemService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _itemService.fetchItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
        if(snapshot.hasData) { //sunucudan hata döndüyse her şey yolundaysa
          return ListView.builder(
            itemCount: snapshot.data!.length,
            //listedeki itemların sayısını itemCount'a gönderir
            itemBuilder: (BuildContext context, int index) {
              Item item = snapshot.data![index];

              return ListTile(title: Text(item.name),);
            },);
        }
        if(snapshot.hasError){ //sunucuda hata varsa
          return Text(snapshot.error.toString()); //bu hatayı ekranda gösterir
        }
        return Center(child: CircularProgressIndicator()); //sunucuyla iletişim kurma aşamasında yükleme işlemi gerçekleşiyor
  },);
  }
}
