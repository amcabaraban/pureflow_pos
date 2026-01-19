import 'package:flutter/material.dart';
import 'sales_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PureFlow POS Dashboard")),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: [
          _menuCard(context, "New Sale", Icons.point_of_sale, const SalesScreen()),
          _menuCard(context, "Customers", Icons.people, const Placeholder()),
          _menuCard(context, "Reports", Icons.bar_chart, const Placeholder()),
          _menuCard(context, "Settings", Icons.settings, const Placeholder()),
        ],
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, IconData icon, Widget screen) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
