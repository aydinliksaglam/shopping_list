import 'package:flutter/material.dart';

class ItemDialog extends StatefulWidget {
  //const ItemDialog({Key? key}) : super(key: key);

  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final _formKey=GlobalKey<FormState>();
  late String _itemName;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Alışveriş öğenizi ekleyin"),
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column( //birden fazla widget'i alt alta ekler
            children: <Widget>[
              Form(
                key: _formKey,
                child: TextFormField(  //TextFormField: formda yazılabilir alan
                  maxLength: 50, //50 karakter yazısı
                  onSaved: (value)=> _itemName=value!,
                  //autofocus: true, //klavyeyi otomatik getirir
                  validator: (value){
                    if(value!.isEmpty){
                      return "validation error";
                    }
                  },
                ),),
              SizedBox(height: 16,),
              FlatButton(child: Text("Alışveriş listesine öge ekle" ), onPressed: _saveForm,
              color: Theme.of(context).accentColor,) //buton rengi
            ],
          ),
        )
      ],
    );
    //return Container();
  }
  void _saveForm() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) { //formun valid olup olmadığını kontrol eder
      Navigator.pop(context, _itemName); //diyalogu kapatır
    }
  }

}
