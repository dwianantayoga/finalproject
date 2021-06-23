import 'package:flutter/material.dart';
import './detail_produk.dart'; 

// menggunakan gesture detector dan navigator 
class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text("Daftar menu")),
      backgroundColor: Colors.orange,
      body: ListView( 
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: <Widget>[
          new GestureDetector( //menggunakan gesture detector agar dapat di klik
            onTap: () {
              Navigator.of(context).push( //menggunakan push agar dapat back ke halaman sebelumnya
                //navigator digunakan untuk menanggil sebuah fungsi atau class
                new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk( //builder memanggil class yang ada di detail produk
                          //kemudian mengirim parameter, untuk menampilkan identitas
                          name: "NASI BAKAR",
                          description: "Nasi Bakar Isi Ikan Teri",
                          price: 5000,
                          image: "nasi_bakar.jpeg",
                          star: 5,
                        )),
              );
            },
            //memanggil class local produkbox
            child: ProductBox(
              //berisikan parameter yang dibutuhkan produkbox
              nama: "NASI BAKAR",
              deskripsi: "Nasi Bakar Isi Ikan Teri",
              harga: 5000,
              image: "nasi_bakar.jpeg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          name: "SATE USUS",
                          description: "Sate Usus Pedas Manis",
                          price: 2000,
                          image: "sate_usus.jpeg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "SATE USUS",
              deskripsi: "Sate Usus Pedas Manis",
              harga: 2000,
              image: "sate_usus.jpeg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          name: "SOSIS BAKAR",
                          description: "Sosis Bakar Pedas Manis",
                          price: 3000,
                          image: "sosis_bakar.jpeg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "SOSIS BAKAR",
              deskripsi: "Sosis Bakar Pedas Manis",
              harga: 3000,
              image: "sosis_bakar.jpeg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          name: "TEMPE BACEM",
                          description: "Tempe bacem pedas manis",
                          price: 3000,
                          image: "tempe_bacem.jpeg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "TEMPE BACEM",
              deskripsi: "Tempe bacem pedas manis",
              harga: 3000,
              image: "tempe_bacem.jpeg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          name: "WEDANG JAHE",
                          description: "Wedang anget jos",
                          price: 3000,
                          image: "wedang_jahe.jpeg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "WEDANG JAHE",
              deskripsi: "Wedang anget jos",
              harga: 3000,
              image: "wedang_jahe.jpeg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          name: "TELUR PUYUH",
                          description: "Telur Puyuh Pedas Manis",
                          price: 5000,
                          image: "telur_puyuh.jpeg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "TELUR PUYUH",
              deskripsi: "Telur Puyuh Pedas Manis",
              harga: 5000,
              image: "telur_puyuh.jpeg",
              star: 5,
            ),
          )
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
    //penangkapan parameter yang diterima dari myhomepage
      {Key key, this.nama, this.deskripsi, this.harga, this.image, this.star})
      : super(key: key);
  final String nama;
  final String deskripsi;
  final int harga;
  final String image;
  final int star;
  final children = <Widget>[];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.black,
      ));
    }// for merupakan syntax yg digunakan untuk menampilkan berapa jumlah bintang

    return Container(
      padding: EdgeInsets.all(10),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset( // menggunakan image lokal
            "assets/appimages/" + image,
            width: 150,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text(
                    this.nama, //untuk nama
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(this.deskripsi), //deskripsi produk
                  Text(
                    "Harga :" + this.harga.toString(), // harga produk
                    style: TextStyle(color: Colors.orange),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: children,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
