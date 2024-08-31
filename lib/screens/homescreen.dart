import 'package:flutter/material.dart';
import 'package:food_appui/data/data.dart';
import 'package:food_appui/models/restaurant.dart';
import 'package:food_appui/screens/cart_screen.dart';
import 'package:food_appui/screens/restuarant_screen.dart';
import 'package:food_appui/widgets/print_rating_stars.dart';
import 'package:food_appui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestuarants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestuarantScreen(
                  restaurant: restaurant,
                ),
              )),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Hero(
                  tag: restaurant.imageUrl!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      height: 110,
                      width: 110,
                      image: AssetImage(restaurant.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        PrintRatingStars(rating: restaurant.rating),
                        Text(
                          restaurant.address!,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Text("1Km away",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Food Delivery",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 30,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                )),
            child: Text(
              "Cart(${currentUser.cart!.length})",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    hintText: "Search Food or Restaurants",
                    hintStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    suffixIcon: const Icon(Icons.clear),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.deepOrangeAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.deepOrangeAccent)))),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Nearby Restaurants",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 1.2),
                ),
              ),
              buildRestuarants(),
            ],
          )
        ],
      ),
    );
  }
}
