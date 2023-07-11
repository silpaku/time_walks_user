import 'package:flutter/material.dart';
import 'package:time_walks/colors/colors.dart';

class MyListViewBuilder extends StatelessWidget {
  final List<String> items;
  final List<String> images;
  final IconData icon;
  final Widget? container;

  MyListViewBuilder(
      {required this.items, required this.images, required this.icon,this.container});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          height: 130,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 72, 70, 70).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                images[index],
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Analog Watch',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      '₹1420',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 35),
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: black, borderRadius: BorderRadius.circular(30),
                        ),
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.minimize,color: Colors.white,),
                            Text('2',style: TextStyle(color: Colors.white),),
                             Icon(Icons.add,color: Colors.white,),

                          ],
                        ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
