import 'package:flutter/material.dart';
import 'package:shoppingg_list1/http/item_service.dart';
import 'package:shoppingg_list1/model/item.dart';
import 'package:shoppingg_list1/ui/dialog/item_dialog.dart';
import 'package:shoppingg_list1/ui/shopping_list_item_page.dart';
//import 'package:shoppingg_list1/http/item_service.dart';

//import 'dialog/item_dialog.dart';

class ShoppingListPage extends StatefulWidget{
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int _selectedIndex=0;
  final PageController _pageController = PageController();
  late ItemService _itemService;

  @override
  void initState(){
    _itemService = ItemService();
    _pageController.addListener(() { //her kaydırma işlemi sonrasında  tekrar çağırılır.
      int currentIndex=_pageController.page!.round();
      if(currentIndex!=_selectedIndex){
        _selectedIndex=currentIndex;
        setState(() { //widgetin yeniden build metodunu çağırmasını sağlar.

        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alışveriş Listesi"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          String itemName = await showDialog(context: context, builder: (BuildContext context)=>ItemDialog());
          //int idN = await showDialog(context: context, builder: (BuildContext context)=>ItemDialog());

          /*if(itemName.isNotEmpty){
            var item = Item(name: itemName,isCompleted:false, isArchived:false,);
            _itemService.addItem(item.toJson()); //oluşturulan item objesini json formatına döndürerek kaydetme işlemini tamamlar
            setState(() {

            });
          }*/

          },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Ana Sayfa")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Alışveriş Listesi")),
          BottomNavigationBarItem(icon: Icon(Icons.archive), title: Text("Arşiv")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            Container(
              color: Colors.purpleAccent,
            ),
            ShoppingListItemPage(),
            Container(color: Colors.lightBlue,
            ),
          ],
        ),
    );
  }

  void _onTap(int value){
    setState(() {
      _selectedIndex=value; //selected'i seçili sayfayla değiştirdi
    });
    _pageController.jumpToPage(value); //pageController'ı ilgili sayfaya yönlendirdi
  //jumpToPage: tıklanılan sayfaya kaydırma işlemini yapar
  }
}