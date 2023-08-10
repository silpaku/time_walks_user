import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<num> totalPriceNotifier = ValueNotifier(0);

class QuantityCartWidget extends StatefulWidget {
  const QuantityCartWidget({
    super.key,
  });

  @override
  State<QuantityCartWidget> createState() => _QuantityCartWidgetState();
}

class _QuantityCartWidgetState extends State<QuantityCartWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: SizedBox(
          width: size.width * 0.2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  log('Reduce count');
                },
                child: const Icon(
                  CupertinoIcons.minus,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5), child: Text('1',style: TextStyle(color: Colors.white),)),
              GestureDetector(
                onTap: () async {
                  log('Add count');
                },
                child: const Icon(
                  CupertinoIcons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
