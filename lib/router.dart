import 'package:emarket/common/widgets/bottom_bar.dart';
import 'package:emarket/features/address/screens/address_screen.dart';
import 'package:emarket/features/admin/screens/add_product_screen.dart';
import 'package:emarket/features/auth/screens/auth_screen.dart';
import 'package:emarket/features/home/screens/category_deals_screen.dart';
import 'package:emarket/features/order_details/screens/order_detials.dart';
import 'package:emarket/features/product_details/screens/product_details_screen.dart';
import 'package:emarket/features/search/screens/search_screen.dart';
import 'package:emarket/models/order.dart';
import 'package:emarket/models/product_model.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());

     case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());

    case AddressScreen.routeName:
    var amount = routeSettings.arguments as String;
      return MaterialPageRoute(
        
          settings: routeSettings, builder: (_) =>  AddressScreen(totalAmount: amount,));

    case OrderDetailsScreen.routeName:
    var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        
          settings: routeSettings, builder: (_) =>  OrderDetailsScreen(order: order,));

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  CategoryDealsScreen(category: category,));

      case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  SearchScreen(searchQuery: searchQuery,));
    
     case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  ProductDetailScreen(product: product,));
    
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist'),
                ),
              ));
  }
}
