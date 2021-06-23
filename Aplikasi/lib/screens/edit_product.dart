import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toko_online/main.dart';
import 'package:http/http.dart' as http;
import 'package:toko_online/screens/homepage.dart';

class EditProduct extends StatefulWidget {
  final Map product;

  EditProduct({@required this.product});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  TextEditingController _imageUrlController = TextEditingController();

  Future updateProduct() async {
    final response = await http.put(
        Uri.parse("http://192.168.1.2:80/api/products" + widget.product['id'.toString()]),
        body: {
          "name": _nameController.text,
          "description": _descriptionController.text,
          "price": _priceController.text,
          "image_url": _imageUrlController.text
        });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: Icon(Icons.arrow_back),
          title: Text("Edit Product"),
        ),
       body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: _nameController..text = widget.product['name'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: _descriptionController
                    ..text = widget.product['description'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: _imageUrlController..text = widget.product['image_url'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "image_url",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: _priceController..text = widget.product['price'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Update',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            updateProduct().then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DataTampil()));
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.orange,
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
