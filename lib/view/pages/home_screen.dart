import 'package:flutter/material.dart';
import 'package:payment_app/view/widgets/fab.dart';
import 'package:payment_app/view/widgets/payment_section.dart';
import 'package:payment_app/view/widgets/user_section.dart';
import 'package:payment_app/view/widgets/visitor_section.dart';
import 'package:payment_app/view_model/user_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userMobx = Provider.of<UserMobx>(context);
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment App'),
        actions: [
          IconButton(
              onPressed: () {
                amountController.text = '2500';
                userMobx.clearData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            UserSection(userMobx: userMobx,),
            PaymentSection(userMobx: userMobx,amountController: amountController,),
            VisitorsSection(userMobx: userMobx,),
          ],
        ),
      )),
      floatingActionButton: buildFloatingActionButton(userMobx),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

