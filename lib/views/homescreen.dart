
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/services/product_service.dart';
import 'package:flutter_firebase_login/views/detailscreen.dart';
import 'package:flutter_firebase_login/views/favorite_controller.dart';
import 'package:flutter_firebase_login/views/logo.dart';
import 'package:flutter_firebase_login/views/register.dart';
//import 'package:flutter_firebase_login/views/seeall.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key});
  
  
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  String selectedBrand ='All';
  final List<String> brands = ['All','BMW','Mercedes','Porsche','Ferrari'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: Column(
          children: [
            SizedBox(height: 80,),
        ListTile(
          leading: Icon(Icons.home),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text("Home"),
          iconColor: Colors.black,
          onTap: () {
            
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite_border_outlined),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text("Favorite"),
          iconColor: Colors.black,
          onTap: () {
            
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text("Message"),
          iconColor: Colors.black,
          onTap: () {
            
          },
        ),
        ListTile(
          leading: Icon(Icons.person_2_sharp),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text("Profile"),
          iconColor: Colors.black,
          onTap: () {  
          },
        ),
        Spacer(),
        SizedBox(
          width: 200,    
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 141, 170, 254),
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(16),
          ),
          onPressed: (){
            Get.back();
          }, 
          child: Text("Logout")),
        ),
        SizedBox(height: 20,)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 237, 237),
        actions: [
        IconButton(
          onPressed: (){}, 
          icon:Badge.count(
            count: 26,
            child: Icon(Icons.notification_add),
          ),
          
          ),
        IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.favorite_border,color: Colors.red,)),
        IconButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Get.offAll(()=> RegisterScreen());
          }, 
          icon: Icon(Icons.logout_sharp,color: Colors.black,)),
       ],
    ),
      
      body: FutureBuilder(
        future: ProductService.getAllProduct(), 
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return  Center(
              child: Text('No users found'),
            );
          }   
          // for filter select car  
          final allProducts = snapshot.data!;
          final filteredProducts =selectedBrand=='All'
          ? allProducts:allProducts.where((pro){
            return pro.name.toString().toLowerCase().contains(selectedBrand
            .toLowerCase());
          }).toList();
        
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:15 ,),
                CarouselSlider(
                  items: [
                    // image 1
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/736x/b6/f1/1e/b6f11ec86140bfa2fa2728eb697653e9.jpg"),
                          fit: BoxFit.cover,
                          ),                     
                      ),
                    ),
                    // image 2
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/736x/25/47/a6/2547a656fa7f94ce1956997f6538f851.jpg"),
                          fit: BoxFit.cover,
                          ),                  
                      ),
                    ),
                    // image 3
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/1200x/dc/8c/75/dc8c75eb8f5bb9c771b4257ae9218bec.jpg"),
                          fit: BoxFit.cover,
                          ),                       
                      ),
                    ),
                    // image 4
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/736x/2c/bf/12/2cbf1225e7e3141a9e6cb3aab7169594.jpg"),
                          fit: BoxFit.cover,
                          ),                       
                      ),
                    ),
                    // image 5
                    Container(
      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/736x/a9/35/ec/a935ec116f00077c83ee8c4912e934a4.jpg"),
                          fit: BoxFit.cover,
                          ),  
                      ),
                    ),
                    // image 6
                    Container(
      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/1200x/ca/88/79/ca8879a614e23945978c129aa579afc0.jpg"),
                          fit: BoxFit.cover,
                          ), 
                      ),
                    ),
                    // image 7
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://i.pinimg.com/1200x/c6/7e/23/c67e2300f4c1b669dbc00fdb050ac7f2.jpg"),
                          fit: BoxFit.cover,
                          ), 
                      ),
                    ),
                  ], 
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 180.0,
                    autoPlayAnimationDuration: Duration(milliseconds: 600),
                    autoPlayCurve: Curves.fastOutSlowIn, 
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                  ),
                  ),
                  SizedBox(height: 35,),
                 
                  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 70,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedBrand == 'All' ? Colors.red : Colors.black,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedBrand = 'All';
                                });
                              },
                              child: Text(
                                "All",
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 80,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedBrand == 'BMW' ? Colors.red : Colors.black,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedBrand = 'BMW';
                                });
                              },
                              child: Text(
                                "BMW",
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),                     
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 80,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedBrand == 'Mercedes' ? Colors.red : Colors.black,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedBrand = 'Mercedes';
                                });
                              },
                              child: Text(
                                "Mercedes",
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),                       
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 80,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedBrand == 'Porsche' ? Colors.red : Colors.black,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedBrand = 'Porsche';
                                });
                              },
                              child: Text(
                                "Porsche",
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedBrand == 'Ferrari' ? Colors.red : Colors.black,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedBrand = 'Ferrari';
                              });
                            },
                            child: Text(
                              "Ferrari",
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Supercar",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      TextButton(
                        onPressed: (){
                          Get.to(ScreenLogo());
                        }, 
                        child: Text("View LOGO",style: 
                        TextStyle(color: Colors.red),))
                      ],
                    ),
                  ),
                  // for find car
                  filteredProducts.isEmpty? Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("No data $selectedBrand"),
                    )
                  :GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.72,

                      ), 
                    itemCount: filteredProducts.length,
                    itemBuilder: (context,index){
                      //
                      final pro = filteredProducts[index];
                     
                      return Stack(
                        children: [
                        Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(60, 246, 198, 198),
                              blurRadius: 8,
                              offset: const Offset(0,2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1.3,
                                child: Image.network("${pro.image}",
                              height: 120,
                              fit: BoxFit.cover,
                              ),)
                            ),
                            
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${pro.name}",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$${pro.price}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: (){
                                    Get.to(Detailscreen(product: pro));
                                  }, 
                                  icon: Icon(Icons.arrow_circle_right_rounded,size: 30,color: Colors.orange,)
                                  )
                              ],
                            ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child:Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 251, 231, 230),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: (){
                              Get.snackbar(
                                "Add to favorite ❤️",
                                "Favorite car",
                                colorText: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 242, 156, 160),
                                duration: Duration(seconds: 6),
                                icon: Icon(Icons.check_circle,),
                                );
                            }, 
                            icon: Icon(Icons.favorite_border,color: Colors.red,)
                            ), 
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 15,
                        child:Container(
                          height: 35,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(18)
                          ),
                          child: IconButton(
                            onPressed: (){                           
                            }, 
                            icon: Text("New",style: TextStyle(color: Colors.white),),
                            ), 
                        ),
                      ),
                        ]
                      );
                    }
                    ),
                    Stack(

                    ),
              ],
            ),
          );
        }
        ),
       
    );
  }
}
