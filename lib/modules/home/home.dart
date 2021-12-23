
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // ignore: avoid_print
            print("hello");
          },
        ),
        title: const Text('First Application'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // ignore: avoid_print
                print("othman");
              },
              icon: const Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                print("hello ");
              },
              icon: Icon(Icons.search))
        ],
      ),
      body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20.0)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image:NetworkImage('https://www.mooveus.fr/blog/wp-content/uploads/2021/02/homme-qui-tient-feuille-768x480.png'),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                      ),
                    Container(
                    
                      color: Colors.black.withOpacity(.7),
                      width: double.infinity,
                      //backgroundColor: Colors.amberAccent,
                      
                      
                      child: Text(

                        "First Image",
                        textAlign:TextAlign.center,
                        style:TextStyle(
                          fontSize: 20.2,
                          color: Colors.red,
                          backgroundColor: Colors.amberAccent,
                        ),

                        ),
                        ),
                  ],
                ),
              ),
            ),
          ],

      ),
    );
  }
}
