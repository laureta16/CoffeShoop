import 'package:coffeeshop/components/coffee_tile.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove item from card
  void removeFromCart(Coffee coffee) {
//add to cart
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    //alert coffe u hoq me sukses
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Drink removed from the cart."),
        backgroundColor: Colors.amber[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              //list of cart items
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get individual cart items
                      Coffee eachCoffee = value.userCart[index];
                      //return the coffe tile ktu
                      return CoffeeTile(
                          coffe: eachCoffee,
                          onPressed: () => removeFromCart(eachCoffee),
                          icon: Icon(Icons.delete));
                    }),
              ),
              //pay button ktu
              Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(22)),
                child: const Center(
                  child: Text(
                    "Pay here",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
