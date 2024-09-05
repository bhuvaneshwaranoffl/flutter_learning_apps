import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
   bool isActive = false;
 int selectedIndex = -1; 
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        centerTitle: true,
        actions: const [Icon(Icons.add), Icon(Icons.remove)],
      ),
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Text("hii"),
              SizedBox(
                height: 20,
              ),
              Text("hii"),
              SizedBox(
                height: 20,
              ),
              Text("hii"),
              SizedBox(
                height: 20,
              ),
              Text("hii"),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){
                setState(() {
                 selectedIndex =index;
                });
              },
              child: Container(
                height: 100,
                color:selectedIndex==index ?Colors.amber : Colors.blue,
                child:const Center(child: Text("ListView builder",textAlign: TextAlign.center,)),
              ),
            ),
          );
        },


      ),
    );
  }
}
