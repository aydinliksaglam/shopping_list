import 'dart:convert';

class Item {
  int id;
  String name;
  bool isCompleted;
  bool isArchived;

  // {}:parametreleri obsiyonel hale getirir.
  Item(this.id, this.name, this.isCompleted, this.isArchived);


//map olarak gelen datayı objeye çevirme
  factory Item.fromJson(Map<dynamic, dynamic> map){ //class içinde factory'i uygulamak için kullanılan yardımcı tanımlama

    return Item(map['id'], map['name'], map['isCompleted'], map['isArchived']
    ); // factory kendi class'ın kendisini dönmek zorunda
    //json objelerini dart objelerine çevirmek için kullanılır
  }

  //objeyi json'a çevirme
  String toJson(){
    var map = <dynamic, dynamic>{};
    //map['id']= id;
    map['name'] = name;
    map['isCompleted'] = isCompleted;
    map['isArchived'] = isArchived;
    return json.encode(map); //map'i json'a çevirir.
  }
}