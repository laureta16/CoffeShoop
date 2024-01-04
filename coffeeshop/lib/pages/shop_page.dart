import 'package:coffeeshop/components/coffee_tile.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    //alert coffe u shtua me sukses
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Drink added to cart! :)",
        ),
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
                    //heading message
                    const Text(
                      "How would you like your coffee?",
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 25),

                    //list of coffee to buy
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.coffeShop.length,
                          itemBuilder: (context, index) {
                            //get individual coffeeee
                            Coffee eachCoffee = value.coffeShop[index];

                            //return the title for this coffee
                            return CoffeeTile(
                              coffe: eachCoffee,
                              icon: Icon(Icons.add),
                              onPressed: () => addToCart(eachCoffee),
                            );
                          }),
                    )
                  ],
                ))));
  }
}
