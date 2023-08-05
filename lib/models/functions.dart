import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_walks/models/wishlistmodel.dart';


//add to wishlist
Future<void> addWishlist(WishlistModel wishlistModel,BuildContext context) async{
  final wishlist=FirebaseFirestore.instance.collection('wishlist');
  final reference=wishlist.doc();

  try{
    await reference.set({
      'id':reference.id,
      'productid':wishlistModel.productId,
      'email':wishlistModel.email,

    }).then((value){
      Fluttertoast.showToast(
                msg: 'Added to wishlist',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    });
  }
   catch (error) {
    log('Failed to add wishlist: $error');
  }
}

//remove from wishlist

Future<void> removeWishlist(WishlistModel wishlistModel, BuildContext context)async{
  final wishlist =FirebaseFirestore.instance.collection('wishlist');

    try {
    await wishlist
        .where('productid', isEqualTo: wishlistModel.productId)
        .where('email', isEqualTo: wishlistModel.email)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
    }).then((value) {
      log('removed from wishlist');
      Fluttertoast.showToast(
        msg: 'Removed from wishlist',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    });
  } catch (error) {
    log('Failed to remove from wishlist: $error');
  }
}

//check wishlist

Future<bool> checkIfDocumentExists(String documentId)async{
 final docSnapshot =await FirebaseFirestore.instance.collection('wishlist').doc(documentId).get();
 return docSnapshot.exists;
}

Future<bool> checkIfProductExistsInWishlist(String userEmail,String productId)async{
  try{
    final wishlistSnapshot=await FirebaseFirestore.instance.collection('wishlist').where('email',isEqualTo: userEmail).where('productid',isEqualTo: productId).limit(1).get();

    return wishlistSnapshot.docs.isNotEmpty;
  }catch(error){
    return false;
  }
}


void deleteWishlist(String itemId, BuildContext context) {
  DocumentReference itemRef =FirebaseFirestore.instance.collection('wishlist').doc(itemId);

  itemRef.delete().then((_) {
    log('Item removed successfully');
    Fluttertoast.showToast(
      msg: 'Removed From Wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }).catchError((error) {
    log('Error removing item: $error');
  });
}
//get product

Stream<DocumentSnapshot> getProductData(String productId) {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  return productsCollection.doc(productId).snapshots();
}