import 'package:emarket/common/widgets/custom_button.dart';
import 'package:emarket/constants/global_variables.dart';
import 'package:emarket/features/address/screens/address_screen.dart';
import 'package:emarket/features/cart/widgets/cart_product.dart';
import 'package:emarket/features/cart/widgets/cart_subtotal.dart';
import 'package:emarket/features/home/widgets/address_box.dart';
import 'package:emarket/features/search/screens/search_screen.dart';
import 'package:emarket/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddressScreen(int sum) {
    Navigator.pushNamed(context, AddressScreen.routeName, arguments: sum.toString());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
     int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: AppBar(
            flexibleSpace: Container(
              //flexibleSpace is used to have a gradient as appbar doesn't allow gradient
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15, top: 8),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search E Market',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                    ),
                  ),
                )),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 22,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AddrressBox(),
              const CartSubTotal(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    hinttext: 'Proceed To Buy (${user.cart.length}) items',
                    onTap: ()=> navigateToAddressScreen(sum),
                    color: GlobalVariables.secondaryColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.black12.withOpacity(0.08),
                height: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                  itemCount: user.cart.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartProduct(index: index);
                  })
            ],
          ),
        ));
  }
}
