import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20  ),
          child: FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 252, 245, 245), 
            onPressed: () {
          
              userMobx.addVisitor();
              VisitorsSection(userMobx: userMobx,);
            },
            label: const Text('Add Visitor'), 
            icon: const Icon(Icons.add), 
           
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class VisitorsSection extends StatelessWidget {
  const VisitorsSection({super.key,required this.userMobx});
  final UserMobx userMobx;
  @override
  Widget build(BuildContext context) {
   return Observer( // Use Observer to react to changes in visitors
      builder: (context) {
        // Access the observable list here
        final visitorsList = userMobx.visitors;

        if(visitorsList.isEmpty){
          return const Center(child: Text('No Visitors',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),));
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: ListView.builder(
            shrinkWrap: true, // Allows ListView to take up minimal space
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: visitorsList.length,
            itemBuilder: (context, index) {
              final visitor = visitorsList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5 ),
                child: Card(
                //  color: const Color.fromARGB(255, 234, 230, 230),
                  elevation: 5,
                  child: ListTile(
                    title: Text(visitor.visitorName),
                    trailing: Text('Amount: ₹${visitor.amount}',style: const TextStyle(fontSize: 12),),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}


class UserSection extends StatelessWidget {
  const UserSection({super.key, required this.userMobx});

  final UserMobx userMobx;

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Card(
          elevation: 5,
          child: Observer(
            builder: (context) {
              if (userMobx.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (userMobx.currentUser == null) {
                return const Center(child: Text('No user data available'));
              }

              final user = userMobx.currentUser!;
              Color borderColor = (userMobx.paymentMethod != null || userMobx.enteredAmount != '2500'|| userMobx.visitors.isNotEmpty)
                  ? Colors.green
                  : Colors.transparent;

              return Column(
                children: [
                  const SizedBox(height: 10,),
                  Observer(
                    builder: (_) {
                      return CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(user.image),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:borderColor,
                            width: 6
                          )
                        ),
                      ),
                    );
                    },
                   
                  ),
                  const SizedBox(height: 10,),
                  Text(user.name,style: const TextStyle(fontSize: 14),),
                  Text(user.email,style: const TextStyle(fontSize: 14),),
                  Text(user.place,style: const TextStyle(fontSize: 14),),
                  Text(user.mobile,style: const TextStyle(fontSize: 14),),
                  Observer(
                    builder: (context){
                      return Text('₹ ${userMobx.enteredAmount}',style: const TextStyle(fontSize: 14 ),);
                    },
                    
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class PaymentSection extends StatefulWidget {
 PaymentSection({super.key,required this.userMobx,required this.amountController});

  final UserMobx userMobx;
  TextEditingController amountController;

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {

  @override
  void initState() {
    super.initState();
    widget.amountController.text = widget.userMobx.enteredAmount;
   
  }

    @override
  void dispose() {
    widget.amountController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              keyboardType: TextInputType.number,
              controller: widget.amountController,
              decoration: InputDecoration(
                labelText: 'Enter amount',
                prefixIcon: const Icon(
                  Icons.currency_rupee,
                  size: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  int amount = int.parse(widget.amountController.text);
                  if (amount <= 0 || amount > 2500) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Amount must be in range 1-2500')));
               
                  }
                  widget.userMobx.updateAmount(value);
                } else {
                  widget.userMobx.updateAmount('0');
              
                }
              },
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 16),
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Observer(
                      builder: (_){
                        return   Radio<String>(
                          value: 'CASH',
                          groupValue: widget.userMobx.paymentMethod,
                          onChanged: (value) {
                            if (value != null) {
                              widget.userMobx.updatePaymentMethod(value);
                            }
                          },
                        );
                      } 
                    ),
                    const Text('CASH'),
                  ],
                ),
                const SizedBox(width: 30,),
                Row(
                  children: [
                    Observer(builder: (_){
                      return Radio<String>(
                      value: 'UPI',
                      groupValue: widget.userMobx.paymentMethod,
                      onChanged: (value) {
                        if (value != null) {
                          widget.userMobx.updatePaymentMethod(value);
                        }
                      },
                    );
                    }),
                    
                    const Text('UPI'),
                  ],
                ),
              ],
            ),
             
            ],
          ),
        ],
      ),
    );
  }
}
