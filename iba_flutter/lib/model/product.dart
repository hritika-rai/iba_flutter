import 'package:flutter/material.dart';

class Product {
  final String ImageUrl;
  final String name;
  final String price;

  Product ({required this.ImageUrl, required this.name, required this.price});
}

List<Product> mockProducts = [
  Product(ImageUrl: 'https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png', name: 'name', price: 'price'),
  Product(ImageUrl: 'https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png', name: 'name', price: 'price'),
  Product(ImageUrl: 'https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png', name: 'name', price: 'price'),
  Product(ImageUrl: 'https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png', name: 'name', price: 'price'),

];

