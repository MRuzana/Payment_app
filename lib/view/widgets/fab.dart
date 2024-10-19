import 'package:flutter/material.dart';
import 'package:payment_app/view/widgets/visitor_section.dart';
import 'package:payment_app/view_model/user_mobx.dart';

Widget buildFloatingActionButton(UserMobx userMobx) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: FloatingActionButton.extended(
      backgroundColor: const Color.fromARGB(255, 252, 245, 245),
      onPressed: () {
        userMobx.addVisitor();
        VisitorsSection(
          userMobx: userMobx,
        );
      },
      label: const Text('Add Visitor'),
      icon: const Icon(Icons.add),
    ),
  );
}
