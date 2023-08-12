// ignore_for_file: prefer_const_constructors
import 'profile.dart';
import 'package:provider/provider.dart';
import 'data_provider_class.dart';
import 'searchPage.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'customDelegate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_detail_screen.dart';
import 'ShipmentPage.dart';
import 'carousel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cartScreen.dart';
import 'customDelegate.dart';
import 'database.dart';
import 'test.dart';
import 'appDrawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
 //  final FirebaseMessaging _firebase_messaging = FirebaseMessaging.instance;
  
 var data; 
 //  Future<void>handlebackground(RemoteMessage message) async {
 //  print('new message dey work');
   
 // }
  void initState()  {
    // TODO: implement initState
    // _firebaseMessaging = FirebaseMessaging.instance;
    
    // data =  DB_helper.instance;

  
   // super.initState();
 //    _firebase_messaging.getToken().then((value){
 //       print(value);
 //   });
    

  }
 // void _subscribeToTopic() async {
 //   try {
    
//     _firebaseMessaging.subscribeToTopic('updates');
     // await _firebaseMessaging.subscribeToTopic('product_updates');
      
//    } catch (e) {
 //     print('Error subscribing to topic: $e');
 //   }
//  }
  @override
  final them = [];
  final favs = [];
  void didChangeDependencies() async {
    print(data);
   // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // prefs.setString('product1', 'false'); 
    // TODO: implement didChangeDependencies
    
   // await _firebase_messaging.requestPermission();
  //  FirebaseMessaging.onBackgroundMessage((message) => handlebackground(message));
    super.didChangeDependencies();
    var prods = await Provider.of<DataModel>(context, listen: false).getProducts();
    prods;
    var things = Provider.of<DataModel>(context,listen: false).products;
    things.forEach((pr) {
    if(prefs.getBool(pr['name']) == null) {
      prefs.setBool(pr['name'], false);
    }
    
    
   });
    setState(() {
      things.forEach((e) {
      if(them.length < things.length) {
         them.add({'name':e['name'],
    'image':e['image'],'info':e['info'],'price':e['price'],'favourite': prefs.getBool(e['name'])});
      }
      
    });
    });
    
   // final pref = await _prefs;
   // print(prefs.getString('product1'));

    // var pp = Provider.of<DataModel>(context).products;
   
    
   
   //print(prefs.getBool(''));
  // print(prods);
    // print(pp);
  }

  @override
  Widget build(BuildContext context)  {
   // var items = Provider.of<DataModel>(context).products;
    final names =  Provider.of<DataModel>(context).allname;
  //  final images =  Provider.of<DataModel>(context).images;
    final cartItem = Provider.of<DataModel>(context).cart;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    
  ];
   shared (name) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();


   }
   void changeFav(index) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
    them[index]['favourite'] = !them[index]['favourite'];
   });
   prefs.setBool(them[index]['name'], !them[index]['name']);
 // var tt = Provider.of<DataModel>(context).products;
  
  // SharedPreferences prefs = await SharedPreferences.getInstance();
 // prefs.setBool(name, !value);
 // print(prefs.getBool(name));
 // print('i just dey oo');
 // print(them);
 // print(tt);
  
 // setState(() {
 // them[index]['favorite'] = !them[index]['favorite'];
//  favs[index][name] = !favs[index][name];    
  //  });

 //   print(favs);
  
//  print(favs[index][name]);
  //return prefs.getBool(name);
  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
 
    var images = Provider.of<DataModel>(context).images;
    var selected;

    return Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomNavigationBar(
       // fabLocation: StylishBarFabLocation.center,
     //   currentIndex: _currentIndex,
      //  hasNotch: true,
      //  opacity: 0.3,
      //  onTap: (index) {
      //  setState(() {
      //      selected = index;
      //  });
    //},
   // currentIndex: selected ?? 0,
   //    barAnimation: BarAnimation.fade,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Test()),
          );
              },
              child: Icon(Icons.home)),
            
          ),
        BottomNavigationBarItem(
            label: 'Search',
            icon: GestureDetector(child: Icon(Icons.search),onTap: () {
            
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate(namess: names,items: them)
              );
            
            }),
            
          ),
        BottomNavigationBarItem(
            label: 'Cart',
            icon: GestureDetector(child: Icon(Icons.shopping_cart),
            onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
            }),
            
          ),
        ],
         // Set the inactive icon color
      ),
      drawer:  IconTheme(
        data: IconThemeData(color: Colors.white), // Set the color here
        child: AppDrawer(),
      ),
        appBar: AppBar(
        //  backgroundColor: Colors.transparent, // Sets the AppBar background color to transparent
          elevation: 0,
          title: Center(child: Text('ShopEasy',
          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))
          ,
          
          
          actions: [
            Container(
              padding: EdgeInsets.all(10),
              child: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ),
              if (true)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 850,
                // MediaQuery.of(context).size.height,
                // column of everythin on the page
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: SizedBox(
                        height: 200,
                        child: //Text('hello there')
                            CarouselWithIndicatorDemo()),
                  ),
                  // for new arrival
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          'New Arrival',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  // grid for new arrival
                  SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: them.length, // Replace with the actual number of items
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width:
                                  180, // Adjust the width of the container to control the card size
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      5.0), // Adjust the spacing between cards
                              child: GestureDetector(
                                onTap: () {
                                   Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productDetail: [them[index]]),
          ),);
                                },
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(
                                        '${them[index]['image']}',
                                        height: 80, // Adjust the image height
                                        width: double
                                            .infinity, // Make the image fill the container width
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(height: 5), // Adjust the spacing
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${them[index]['name']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5), // Adjust the spacing
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                '#${them[index]['price']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                   //       Padding(
                                    //          padding: EdgeInsets.all(8.0),
                                     //         child: Icon(Icons.favorite_border))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                  // grid for best seller
                  SizedBox(height: 20),
                  Padding(
                    padding:EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text('Best Seller',style: TextStyle(fontWeight: FontWeight.bold))
                      ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.topLeft, 
                      height: 200,
                      child: GridView.builder(
      padding: EdgeInsets.all(8.0),
      shrinkWrap: true,
      scrollDirection: Axis.vertical, // Set scroll direction to horizontal
      itemCount: them.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust this value based on your desired number of items in a row
        childAspectRatio: 1,
         crossAxisSpacing: 10.0, // Add spacing between adjacent grids
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
      //  final product = products[index];
          
        
        return  Stack(
            children: [
              Row(
                children: [
                  Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: GestureDetector(
                              onTap: () {
                                   Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productDetail: [them[index]]),
          ),);
                                },
                              child: Image.network(
                                '${them[index]['image']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ),
                  
                  
                ],
              ),
              Positioned(
            top: 8.0,
            right: 8.0,
            child: Container(
              padding: EdgeInsets.all(4.0),
              color: Colors.black.withOpacity(0.5),
              child: IconButton(
                onPressed: () async {
                  
                  SharedPreferences prefs = await SharedPreferences.getInstance();

                 // print(prefs.getString('product0'));
                  changeFav(index);
                  print(them);
                  
                }, 
                 icon: (them[index]['favourite']) ? Icon(Icons.favorite,color: Colors.pink) : Icon(Icons.favorite_border)
                 // Icon(Icons.favorite)
                    
                // (favs[index]['name']) ? Icon(Icons.favorite,color: Colors.pink) : Icon(Icons.favorite_border), 
              //   
             // Icon(Icons.favorite)
                
                 
                 
               
               

              ),
            ),
          ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${them[index]['name']}',
                            style: TextStyle(color: Colors.white, fontSize: 10, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          children: [
                            
                            SizedBox(width: 2),
                            Text(
                                '#${them[index]['price']} ',
                                style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
                              ),
                            
                            SizedBox(width: 10)
                          ],
                        ),
                      ],
                  ),
                ),
              ),
            ],
                      );
        
        }
        )
        ),
                  )
                  
                ]),
              )),
        )
        );
  }
}
