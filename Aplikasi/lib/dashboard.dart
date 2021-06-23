import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title:
          // menyusun tulisan secara horizontal dan di tengah
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Aplikasi Angkringan'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('clik start');
            },
          ),
        ],
      ),
      drawer: new Drawer(
        //menggunakan listview karena di dalam drawer terdapat banyak menu
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader( //UserAccountsDrawerHeader sudah ada di fungsi widget
              accountName: new Text("I Made Dwi Ananta Yoga"),
              accountEmail: new Text("dwi.ananta@undiksha.ac.id"),
              currentAccountPicture: new GestureDetector(
                onTap: () {},//dapat melakukan apa 
                child: new CircleAvatar(
                  backgroundImage:new NetworkImage(
                    'https://1.bp.blogspot.com/-nF8MxGGYIf8/YFKU3DdhghI/AAAAAAAAAFw/rDB9Z-9WqPE7z8yC8jt-CZ_A86ZQlLjPACLcBGAsYHQ/s1458/IMG_20200620_115228_648.jpg'),
                ),
              ),
              decoration: BoxDecoration( //untuk background foto di drawer
                image: DecorationImage(
                    image: AssetImage('assets/appimages/latar.jpeg'),
                    fit: BoxFit.cover),
              )),
          new ListTile( // listtile merupakan anak dari listview yang berupa menu
            title: new Text('Notifications'),
            trailing: new Icon(Icons.notifications_none),
          ),
          new ListTile(
            title: new Text('Wishlist'),
            trailing: new Icon(Icons.bookmark_border),
          ),
          new ListTile(
            title: new Text('Setting'),
            trailing: new Icon(Icons.settings),
          ),
          new ListTile(
            title: new Text('About '),
            trailing: new Icon(Icons.info),
          ),
          new ListTile(
            title: new Text(
                'Aplikasi angkringan ini merupakan aplikasi yang menjual aneka ragam makanan dan minuman, biasanya hal ini hanya dijual di pinggir jalan tetapi dengan adanya aplikasi ini membuat pembeli bisa memesan melalui aplikasi'),
          ),
        ]),
      ),//enddrawer
//seluruh body dibungkus colum
      body: new ListView(
        children: <Widget>[
          Image.asset("assets/appimages/logo1.jpg"),
//setiap bagian pada body dipisahkan container yang berisikan ringkasan aplikasi
          Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
//untuk membuat tampilan secara horizontal digunakan row
            child: Row(
              children: [
                Expanded( // dihabiskan agar tidak terlalu kekiri dan terlalu kekanan
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data barang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black
                ),
              ],
            ),
          ),
          
           Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
//untuk membuat tampilan secara horizontal digunakan row
            child: Row(
              children: [
                Expanded( // dihabiskan agar tidak terlalu kekiri dan terlalu kekanan
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Barang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black
                ),
              ],
            ),
          ),
//setiap bagian pada body dipisahkan container
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
//untuk membuat tampilan secara horizontal maka digunakan row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//untuk membuat tampilan secara vertikal maka digunakan colum
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.grid_on, color: Colors.yellow),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Semua Menu",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.fastfood_outlined, color: Colors.yellow),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Food Drink",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.food_bank, color: Colors.yellow),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Makanan",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_drink, color: Colors.yellow),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Minuman",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Banyak Menu Baru',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Makanan dan Minuman ',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Yuk Beli '),
              ],
            ),
          )
        ],
      ),
    );
  }
}
