import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sae_mobile/product.dart';

// ... Product class ...

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];
  List<Product> _favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final json = jsonDecode(response.body) as List<dynamic>;
    final products = json.map((e) => Product.fromJson(e)).toList();
    setState(() {
      _products = products;
    });
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (_favoriteProducts.contains(product)) {
        _favoriteProducts.remove(product);
      } else {
        _favoriteProducts.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: _products.isNotEmpty
          ? ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          final isFavorite = _favoriteProducts.contains(product);

          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      textAlign: TextAlign.end,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () => _toggleFavorite(product),
                  ),
                ],
              ),
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
