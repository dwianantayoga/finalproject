import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  DetailProduk(
    // untuk menampung parameter yang dikirim dari produklist, harus disesuaikan dengan yg ada di produklist
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
    //variabel untuk menampung parameter
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  //inisialisasi variabel star
  final childrenstar = <Widget>[];
  @override
  Widget build(BuildContext context) {
    //membuat star secara dinamis sesuai jumlah star yang dikirim dari produklist
    for (var i = 0; i < widget.star; i++) {
      childrenstar.add(new Icon(
        //memasukan icon start ke cariabel childrenstar
        Icons.star,
        size: 15,
        color: Colors.black,
      ));
    }
    return Scaffold(
      appBar: new AppBar(
        //title detail produk yang isinya name produk dalam widget text
        title: new Text("${widget.name}"),
      ),
      body: new Container(
        width: double.infinity,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Image.asset("assets/appimages/" + widget.image)
              ],
            ),
            Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
              ),
              padding: EdgeInsets.all(10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: childrenstar,
                  ),
                  new Container(
                    child: new Text(
                      this.widget.price.toString(), //menampilkan harga
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "NeoSansBold"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10), color: Colors.lightBlue,
//maximal width
              width: double.infinity,
//maximal height
              height: double.maxFinite,
              child: new Text(widget.description),// menampilkan deskripsi
            )
          ],
        ),
      ),
    );
  }
}
