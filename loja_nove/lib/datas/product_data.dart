
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot){
      id = snapshot.id;
      title = snapshot["title"];
      description = snapshot.get("description");
      price = snapshot["price"] + 0.0;
      images = snapshot["images"];
      sizes = snapshot.get("sizes");
  }

}