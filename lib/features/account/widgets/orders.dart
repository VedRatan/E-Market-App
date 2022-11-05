import 'package:emarket/common/widgets/loader.dart';
import 'package:emarket/constants/global_variables.dart';
import 'package:emarket/features/account/services/account_services.dart';
import 'package:emarket/features/account/widgets/single_product.dart';
import 'package:emarket/features/order_details/screens/order_detials.dart';
import 'package:emarket/models/order.dart';

import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //temporary list
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 18,
                        color: GlobalVariables.selectedNavBarColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              //display orders

              Container(
                height: 170,
                padding: EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orders!.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, OrderDetailsScreen.routeName);
                          },
                          child: SingleProduct(
                              image: orders![index].products[0].images[0]));
                    })),
              )
            ],
          );
  }
}
