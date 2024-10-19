import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payment_app/view_model/user_mobx.dart';

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
                  _buildPaymentMethodRadio('CASH', 'CASH'),
                  _buildPaymentMethodRadio('UPI', 'UPI'),               
                ],
              ),
             
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodRadio(String value, String label) {
    return Row(
      children: [
        Observer(
          builder: (_) {
            return Radio<String>(
              value: value,
              groupValue: widget.userMobx.paymentMethod,
              onChanged: (value) {
                if (value != null) {
                  widget.userMobx.updatePaymentMethod(value);
                }
              },
            );
          },
        ),
        Text(label),
      ],
    );
  }

}


