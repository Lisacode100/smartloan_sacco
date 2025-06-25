import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import 'home_page.dart';
import 'loans_plan.dart';
import 'users_page.dart';
import 'payment_page.dart';
import 'browsers_page.dart';

// Make sure StatelessWidget is imported from material.dart above.

class DashboardPage extends StatelessWidget {
  final payments = [
    {
      "refNo": "S001023",
      "payee": "Nikhil",
      "amount": "\$600.00",
      "penalty": "\$0.00"
    },
    {
      "refNo": "S001024",
      "payee": "Ajay",
      "amount": "\$600.00",
      "penalty": "\$0.00"
    },
  ];

 DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(title: Text("SACCO SHIELD Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDashboardCards(),
            SizedBox(height: 20),
            Text(
              "Payment List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildPaymentsTable(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("SACCO SHIELD", style: TextStyle(fontSize: 20)),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.dashboard),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage())),
          ),
          ListTile(
            title: Text("Loans"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoansPage())),
          ),
          ListTile(
            title: Text("Payments"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentsPage())),
          ),
          ListTile(
            title: Text("Borrowers"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BrowsersPage())),
          ),
          
         
          ListTile(
            title: Text("Users"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UsersPage())),
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.pop(context); // Close drawer
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Logged out successfully')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DashboardCard(
          title: "Payments Today",
          value: "0.00",
          color: Colors.blue,
          icon: Icons.payment,
        ),
        DashboardCard(
          title: "Borrowers",
          value: "2",
          color: Colors.green,
          icon: Icons.people,
        ),
        DashboardCard(
          title: "Active Loans",
          value: "2",
          color: Colors.amber,
          icon: Icons.assignment,
        ),
        DashboardCard(
          title: "Total Receivable",
          value: "6,289,600.00",
          color: Colors.purple,
          icon: Icons.attach_money,
        ),
      ],
    );
  }

  Widget _buildPaymentsTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: DataTable(
          columnSpacing: 12,
          dataRowMinHeight: 40,
          dataRowMaxHeight: 60,
          headingRowHeight: 40,
          columns: [
            DataColumn(label: Text("#", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Loan Ref No", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
              label: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100),
                child: Text("Payee", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            DataColumn(label: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Penalty", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: List.generate(payments.length, (index) {
            final p = payments[index];
            return DataRow(
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text(p["refNo"]!, overflow: TextOverflow.ellipsis)),
                DataCell(
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text(p["payee"]!, overflow: TextOverflow.ellipsis),
                  ),
                ),
                DataCell(Text(p["amount"]!, overflow: TextOverflow.ellipsis)),
                DataCell(Text(p["penalty"]!, overflow: TextOverflow.ellipsis)),
                DataCell(
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.blue, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      SizedBox(width: 4),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.red, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
