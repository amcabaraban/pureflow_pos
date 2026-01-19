import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String deliveryType = "Pickup";
  int quantity = 1;
  double price = 15;

  final Map<String, double> pricing = {
    "Pickup": 15,
    "Store Retailer Delivery": 20,
    "Long Distance Delivery": 25,
    "Very Long Distance Delivery": 30,
    "Suki / Bulk Special": 0,
  };

  double get total => price * quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Sale")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("5-Gallon Round Container", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: deliveryType,
              decoration: const InputDecoration(labelText: "Delivery Type"),
              items: pricing.keys.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  deliveryType = value!;
                  price = pricing[value]!;
                });
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              initialValue: "1",
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantity"),
              onChanged: (val) {
                setState(() {
                  quantity = int.tryParse(val) ?? 1;
                });
              },
            ),

            const SizedBox(height: 20),

            Text("Price per Gallon: ₱$price", style: const TextStyle(fontSize: 18)),
            Text("TOTAL: ₱$total", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sale recorded successfully")),
                );
              },
              child: const Text("CONFIRM SALE"),
            )
          ],
        ),
      ),
    );
  }
}
