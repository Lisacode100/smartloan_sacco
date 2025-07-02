// // // ignore_for_file: deprecated_member_use

// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:intl/intl.dart';
// // import 'package:table_calendar/table_calendar.dart';
// // import 'loan.dart';

// // class MemberDashboard extends StatefulWidget {
// //   final String userName;
// //   final String email;
// //   final double currentSavings;
// //   final List<Loan> loans;
// //   final String? profileImageUrl;

// //   const MemberDashboard({
// //     super.key,
// //     required this.userName,
// //     required this.email,
// //     required this.currentSavings,
// //     required this.loans,
// //     this.profileImageUrl,
// //   });

// //   @override
// //   State<MemberDashboard> createState() => _MemberDashboardState();
// // }

// // class LoanApplicationScreen extends StatelessWidget {
// //   final String memberId;
// //   final double memberSavings;
// //   final Function(Map<String, dynamic>) onSubmit;

// //   const LoanApplicationScreen({
// //     super.key,
// //     required this.memberId,
// //     required this.memberSavings,
// //     required this.onSubmit,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     // Placeholder UI for loan application
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Apply for Loan')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             // Simulate loan application submission
// //             onSubmit({'amount': 1000, 'memberId': memberId});
// //           },
// //           child: const Text('Submit Loan Application'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _MemberDashboardState extends State<MemberDashboard> {
// //   final Color _primaryColor = Colors.blue;
// //   final Color _successColor = const Color.fromARGB(103, 32, 155, 139);
// //   final Color _dangerColor = Colors.purple;
// //   final Color _bgColor = const Color(0xFFF5F6FA);
// //   final Color _textSecondary = const Color.fromARGB(255, 8, 56, 71);

// //   int _currentIndex = 0;
  
// //   // Calendar variables
// //   late DateTime _focusedDay;
// //   DateTime? _selectedDay;
// //   CalendarFormat _calendarFormat = CalendarFormat.month;
// //   Map<DateTime, List<Loan>> _loanEvents = {};

// //   @override
// //   void initState() {
// //     super.initState();
// //     _focusedDay = DateTime.now();
// //     _selectedDay = DateTime.now();
// //     _loadLoanEvents();
// //   }

// //   void _loadLoanEvents() {
// //     _loanEvents = {};
// //     for (var loan in widget.loans) {
// //       final dueDate = DateTime(
// //         loan.dueDate.year,
// //         loan.dueDate.month,
// //         loan.dueDate.day,
// //       );
      
// //       if (_loanEvents[dueDate] == null) {
// //         _loanEvents[dueDate] = [];
// //       }
// //       _loanEvents[dueDate]!.add(loan);
// //     }
// //   }

// //   List<Loan> _getLoansForDay(DateTime day) {
// //     return _loanEvents[day] ?? [];
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: _bgColor,
// //       appBar: AppBar(
// //         title: Text(
// //           _getAppBarTitle(),
// //           style: GoogleFonts.poppins(
// //             fontSize: 18,
// //             fontWeight: FontWeight.w600,
// //             color: Colors.white,
// //           ),
// //         ),
// //         backgroundColor: _primaryColor,
// //         elevation: 0,
// //         actions: _currentIndex == 3 ? [_buildLoanFilterMenu()] : null,
// //       ),
// //       body: _getCurrentScreen(),
// //       bottomNavigationBar: _buildBottomNavigationBar(),
// //     );
// //   }

// //   PopupMenuButton<String> _buildLoanFilterMenu() {
// //     return PopupMenuButton<String>(
// //       onSelected: _filterLoans,
// //       itemBuilder: (BuildContext context) => [
// //         const PopupMenuItem(value: 'all', child: Text('All Loans')),
// //         const PopupMenuItem(value: 'active', child: Text('Active Loans')),
// //         const PopupMenuItem(value: 'completed', child: Text('Completed Loans')),
// //         const PopupMenuItem(value: 'overdue', child: Text('Overdue Loans')),
// //       ],
// //       icon: const Icon(Icons.filter_list, color: Colors.white),
// //     );
// //   }

// //   void _filterLoans(String filter) {
// //     // Implement filtering logic here
// //     setState(() {
// //       // Filter widget.loans based on the selected filter
// //     });
// //   }

// //   Widget _getCurrentScreen() {
// //     switch (_currentIndex) {
// //       case 0: return _buildHomeScreen();
// //       case 1: return _buildSavingsScreen();
// //       case 2: return LoanApplicationScreen(
// //         memberId: widget.email,
// //         memberSavings: widget.currentSavings,
// //         onSubmit: _submitLoanApplication,
// //       );
// //       case 3: return _buildLoansScreen();
// //       case 4: return _buildTransactionsScreen();
// //       default: return _buildHomeScreen();
// //     }
// //   }

// //   Widget _buildBottomNavigationBar() {
// //     return BottomNavigationBar(
// //       currentIndex: _currentIndex,
// //       onTap: (index) {
// //         if (index == 5) {
// //           Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
// //         } else {
// //           setState(() => _currentIndex = index);
// //         }
// //       },
// //       selectedItemColor: _primaryColor,
// //       unselectedItemColor: _textSecondary,
// //       type: BottomNavigationBarType.fixed,
// //       items: const [
// //         BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
// //         BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
// //         BottomNavigationBarItem(icon: Icon(Icons.request_page), label: 'Apply Loan'),
// //         BottomNavigationBarItem(icon: Icon(Icons.money), label: 'My Loans'),
// //         BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transactions'),
// //         BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
// //       ],
// //     );
// //   }

// //   Widget _buildHomeScreen() {
// //     return SingleChildScrollView(
// //       padding: const EdgeInsets.all(16),
// //       child: Column(
// //         children: [
// //           _buildHeaderSection(),
// //           const SizedBox(height: 20),
// //           _buildQuickStatsCard(),
// //           const SizedBox(height: 20),
// //           _buildCalendarSection(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildHeaderSection() {
// //     return Row(
// //       children: [
// //         CircleAvatar(
// //           radius: 30,
// //           backgroundImage: widget.profileImageUrl != null
// //               ? NetworkImage(widget.profileImageUrl!)
// //               : const AssetImage('assets/default_profile.png') as ImageProvider,
// //         ),
// //         const SizedBox(width: 16),
// //         Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Welcome, ${widget.userName}',
// //               style: GoogleFonts.poppins(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             Text(
// //               widget.email,
// //               style: GoogleFonts.poppins(
// //                 color: _textSecondary,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildQuickStatsCard() {
// //     return Card(
// //       elevation: 2,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             _buildStatItem(Icons.savings, 'Savings', _formatCurrency(widget.currentSavings)),
// //             _buildStatItem(Icons.money, 'Loans', widget.loans.length.toString()),
// //             _buildStatItem(Icons.payments, 'Due', _formatCurrency(_calculateTotalDue())),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildStatItem(IconData icon, String label, String value) {
// //     return Column(
// //       children: [
// //         Icon(icon, color: _primaryColor),
// //         const SizedBox(height: 8),
// //         Text(label, style: GoogleFonts.poppins(fontSize: 12)),
// //         Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
// //       ],
// //     );
// //   }

// //   Widget _buildCalendarSection() {
// //     return Card(
// //       elevation: 2,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Payment Calendar',
// //               style: GoogleFonts.poppins(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             TableCalendar<Loan>(
// //               firstDay: DateTime.now().subtract(const Duration(days: 365)),
// //               lastDay: DateTime.now().add(const Duration(days: 365)),
// //               focusedDay: _focusedDay,
// //               selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
// //               calendarFormat: _calendarFormat,
// //               eventLoader: _getLoansForDay,
// //               startingDayOfWeek: StartingDayOfWeek.monday,
// //               calendarStyle: CalendarStyle(
// //                 todayDecoration: BoxDecoration(
// //                   color: _primaryColor.withOpacity(0.5),
// //                   shape: BoxShape.circle,
// //                 ),
// //                 selectedDecoration: BoxDecoration(
// //                   color: _primaryColor,
// //                   shape: BoxShape.circle,
// //                 ),
// //                 markersAnchor: 0.2,
// //                 markerDecoration: BoxDecoration(
// //                   color: _dangerColor,
// //                   shape: BoxShape.circle,
// //                 ),
// //                 markerMargin: const EdgeInsets.symmetric(horizontal: 1),
// //                 markerSize: 6,
// //               ),
// //               headerStyle: HeaderStyle(
// //                 formatButtonVisible: true,
// //                 titleCentered: true,
// //                 formatButtonDecoration: BoxDecoration(
// //                   color: _primaryColor,
// //                   borderRadius: BorderRadius.circular(5),
// //                 ),
// //                 formatButtonTextStyle: const TextStyle(color: Colors.white),
// //                 leftChevronIcon: Icon(Icons.chevron_left, color: _primaryColor),
// //                 rightChevronIcon: Icon(Icons.chevron_right, color: _primaryColor),
// //               ),
// //               daysOfWeekStyle: DaysOfWeekStyle(
// //                 weekdayStyle: GoogleFonts.poppins(color: _textSecondary),
// //                 weekendStyle: GoogleFonts.poppins(color: _textSecondary),
// //               ),
// //               onDaySelected: (selectedDay, focusedDay) {
// //                 setState(() {
// //                   _selectedDay = selectedDay;
// //                   _focusedDay = focusedDay;
// //                 });
// //               },
// //               onFormatChanged: (format) {
// //                 setState(() {
// //                   _calendarFormat = format;
// //                 });
// //               },
// //               onPageChanged: (focusedDay) {
// //                 _focusedDay = focusedDay;
// //               },
// //             ),
// //             const SizedBox(height: 16),
// //             ..._buildEventList(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   List<Widget> _buildEventList() {
// //     if (_selectedDay == null) return [];
    
// //     final loans = _getLoansForDay(_selectedDay!);
    
// //     if (loans.isEmpty) {
// //       return [
// //         Text(
// //           'No payments due',
// //           style: GoogleFonts.poppins(color: _textSecondary),
// //         ),
// //       ];
// //     }

// //     return [
// //       Text(
// //         'Payments due:',
// //         style: GoogleFonts.poppins(
// //           fontWeight: FontWeight.bold,
// //           fontSize: 16,
// //         ),
// //       ),
// //       const SizedBox(height: 8),
// //       ...loans.map((loan) => Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 4),
// //         child: Card(
// //           elevation: 1,
// //           child: Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Row(
// //               children: [
// //                 Icon(
// //                   Icons.account_balance_wallet,
// //                   color: _getStatusColor(loan.status).withOpacity(0.8),
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Loan #${loan.id}',
// //                         style: GoogleFonts.poppins(
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                       Text(
// //                         'Amount: ${_formatCurrency(loan.remainingBalance)}',
// //                         style: GoogleFonts.poppins(fontSize: 12),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: _primaryColor,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                   ),
// //                   onPressed: () => _makePayment(loan),
// //                   child: Text(
// //                     'Pay Now',
// //                     style: GoogleFonts.poppins(color: Colors.white),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       )),
// //     ];
// //   }

// //   Widget _buildSavingsScreen() {
// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(Icons.savings, size: 60, color: _primaryColor),
// //           const SizedBox(height: 16),
// //           Text(
// //             'Savings Account', 
// //             style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             'Balance: ${_formatCurrency(widget.currentSavings)}', 
// //             style: GoogleFonts.poppins(fontSize: 24),
// //           ),
// //           const SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: () {},
// //             child: Text('Make Deposit', style: GoogleFonts.poppins()),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildLoansScreen() {
// //     if (widget.loans.isEmpty) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(Icons.money_off, size: 60, color: _primaryColor),
// //             const SizedBox(height: 16),
// //             Text(
// //               'No Active Loans', 
// //               style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'You currently don\'t have any loans',
// //               style: GoogleFonts.poppins(color: _textSecondary),
// //             ),
// //           ],
// //         ),
// //       );
// //     }

// //     return ListView.builder(
// //       padding: const EdgeInsets.all(16),
// //       itemCount: widget.loans.length,
// //       itemBuilder: (context, index) {
// //         final loan = widget.loans[index];
// //         return _buildLoanCard(loan);
// //       },
// //     );
// //   }

// //   Widget _buildLoanCard(Loan loan) {
// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 16),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   'Loan #${loan.id}', 
// //                   style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
// //                 ),
// //                 Chip(
// //                   label: Text(loan.status),
// //                   backgroundColor: _getStatusColor(loan.status),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 10),
// //             _buildLoanDetailRow('Amount:', _formatCurrency(loan.amount)),
// //             _buildLoanDetailRow('Balance:', _formatCurrency(loan.remainingBalance)),
// //             _buildLoanDetailRow('Disbursed:', 
// //                 DateFormat('MMM d, y').format(loan.disbursementDate)),
// //             _buildLoanDetailRow('Due:', 
// //                 DateFormat('MMM d, y').format(loan.dueDate)),
// //             const SizedBox(height: 10),
// //             if (loan.status == 'Active')
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: () => _makePayment(loan),
// //                   child: const Text('Make Payment'),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTransactionsScreen() {
// //     return Center(
// //       child: Text(
// //         'Transactions History', 
// //         style: GoogleFonts.poppins(fontSize: 18)),
// //     );
// //   }

// //   Color _getStatusColor(String status) {
// //     switch (status.toLowerCase()) {
// //       case 'active': return _successColor.withOpacity(0.2);
// //       case 'overdue': return _dangerColor.withOpacity(0.2);
// //       case 'completed': return Colors.grey.withOpacity(0.2);
// //       default: return Colors.blue.withOpacity(0.2);
// //     }
// //   }

// //   Widget _buildLoanDetailRow(String label, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4),
// //       child: Row(
// //         children: [
// //           Text(
// //             '$label ', 
// //             style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
// //           ),
// //           Text(value, style: GoogleFonts.poppins()),
// //         ],
// //       ),
// //     );
// //   }

// //   Future<void> _submitLoanApplication(Map<String, dynamic> application) async {
// //     try {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Loan application submitted successfully!')),
// //       );
// //       setState(() => _currentIndex = 3);
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error: ${e.toString()}')),
// //       );
// //     }
// //   }

// //   void _makePayment(Loan loan) {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Make Payment'),
// //         content: Text('Payment for Loan #${loan.id}'),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text('Cancel'),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 const SnackBar(content: Text('Payment processed successfully')),
// //               );
// //             },
// //             child: const Text('Confirm'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   double _calculateTotalDue() {
// //     return widget.loans.fold(0, (sum, loan) => sum + loan.remainingBalance);
// //   }

// //   String _getAppBarTitle() {
// //     switch (_currentIndex) {
// //       case 0: return 'Dashboard';
// //       case 1: return 'Savings';
// //       case 2: return 'Apply Loan';
// //       case 3: return 'My Loans';
// //       case 4: return 'Transactions';
// //       default: return 'Dashboard';
// //     }
// //   }

// //   String _formatCurrency(double amount) {
// //     return NumberFormat.currency(symbol: 'UGX ', decimalDigits: 0).format(amount);
// //   }
// // }

// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'loan_application.dart';
// import 'loan.dart';

// class MemberDashboard extends StatefulWidget {
//   final String userName;
//   final String email;
//   final double currentSavings;
//   final List<Loan> loans;
//   final String? profileImageUrl;

//   const MemberDashboard({
//     super.key,
//     required this.userName,
//     required this.email,
//     required this.currentSavings,
//     required this.loans,
//     this.profileImageUrl,
//   });

//   @override
//   State<MemberDashboard> createState() => _MemberDashboardState();
// }

// class _MemberDashboardState extends State<MemberDashboard> {
//   final Color _primaryColor = Colors.blue;
//   final Color _successColor = const Color.fromARGB(103, 32, 155, 139);
//   final Color _dangerColor = Colors.purple;
//   final Color _bgColor = const Color(0xFFF5F6FA);
//   final Color _textSecondary = const Color.fromARGB(255, 8, 56, 71);

//   int _currentIndex = 0;
  
//   // Calendar variables
//   late DateTime _focusedDay;
//   DateTime? _selectedDay;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   Map<DateTime, List<Loan>> _loanEvents = {};

//   @override
//   void initState() {
//     super.initState();
//     _focusedDay = DateTime.now();
//     _selectedDay = DateTime.now();
//     _loadLoanEvents();
//   }

//   void _loadLoanEvents() {
//     _loanEvents = {};
//     for (var loan in widget.loans) {
//       final dueDate = DateTime(
//         loan.dueDate.year,
//         loan.dueDate.month,
//         loan.dueDate.day,
//       );
      
//       if (_loanEvents[dueDate] == null) {
//         _loanEvents[dueDate] = [];
//       }
//       _loanEvents[dueDate]!.add(loan);
//     }
//   }

//   List<Loan> _getLoansForDay(DateTime day) {
//     return _loanEvents[day] ?? [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _bgColor,
//       appBar: AppBar(
//         title: Text(
//           _getAppBarTitle(),
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: _primaryColor,
//         elevation: 0,
//         actions: _currentIndex == 3 ? [_buildLoanFilterMenu()] : null,
//       ),
//       body: _getCurrentScreen(),
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

//   PopupMenuButton<String> _buildLoanFilterMenu() {
//     return PopupMenuButton<String>(
//       onSelected: _filterLoans,
//       itemBuilder: (BuildContext context) => [
//         const PopupMenuItem(value: 'all', child: Text('All Loans')),
//         const PopupMenuItem(value: 'active', child: Text('Active Loans')),
//         const PopupMenuItem(value: 'completed', child: Text('Completed Loans')),
//         const PopupMenuItem(value: 'overdue', child: Text('Overdue Loans')),
//       ],
//       icon: const Icon(Icons.filter_list, color: Colors.white),
//     );
//   }

//   void _filterLoans(String filter) {
//     // Implement filtering logic here
//     setState(() {
//       // Filter widget.loans based on the selected filter
//     });
//   }

//   Widget _getCurrentScreen() {
//     switch (_currentIndex) {
//       case 0: return _buildHomeScreen();
//       case 1: return _buildSavingsScreen();
//       case 2: return LoanApplicationScreen(
//         memberId: widget.email,
//         memberSavings: widget.currentSavings,
//         onSubmit: _submitLoanApplication,
//       );
//       case 3: return _buildLoansScreen();
//       case 4: return _buildTransactionsScreen();
//       default: return _buildHomeScreen();
//     }
//   }

//   Widget _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         if (index == 5) {
//           Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
//         } else {
//           setState(() => _currentIndex = index);
//         }
//       },
//       selectedItemColor: _primaryColor,
//       unselectedItemColor: _textSecondary,
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
//         BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
//         BottomNavigationBarItem(icon: Icon(Icons.request_page), label: 'Apply Loan'),
//         BottomNavigationBarItem(icon: Icon(Icons.money), label: 'My Loans'),
//         BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transactions'),
//         BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
//       ],
//     );
//   }

//   Widget _buildHomeScreen() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           _buildHeaderSection(),
//           const SizedBox(height: 20),
//           _buildQuickStatsCard(),
//           const SizedBox(height: 20),
//           _buildCalendarSection(),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeaderSection() {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundImage: widget.profileImageUrl != null
//               ? NetworkImage(widget.profileImageUrl!)
//               : const AssetImage('assets/default_profile.png') as ImageProvider,
//         ),
//         const SizedBox(width: 16),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Welcome, ${widget.userName}',
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               widget.email,
//               style: GoogleFonts.poppins(
//                 color: _textSecondary,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickStatsCard() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildStatItem(Icons.savings, 'Savings', _formatCurrency(widget.currentSavings)),
//             _buildStatItem(Icons.money, 'Loans', widget.loans.length.toString()),
//             _buildStatItem(Icons.payments, 'Due', _formatCurrency(_calculateTotalDue())),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatItem(IconData icon, String label, String value) {
//     return Column(
//       children: [
//         Icon(icon, color: _primaryColor),
//         const SizedBox(height: 8),
//         Text(label, style: GoogleFonts.poppins(fontSize: 12)),
//         Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
//       ],
//     );
//   }

//   Widget _buildCalendarSection() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Payment Calendar',
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             TableCalendar<Loan>(
//               firstDay: DateTime.now().subtract(const Duration(days: 365)),
//               lastDay: DateTime.now().add(const Duration(days: 365)),
//               focusedDay: _focusedDay,
//               selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//               calendarFormat: _calendarFormat,
//               eventLoader: _getLoansForDay,
//               startingDayOfWeek: StartingDayOfWeek.monday,
//               calendarStyle: CalendarStyle(
//                 todayDecoration: BoxDecoration(
//                   color: _primaryColor.withOpacity(0.5),
//                   shape: BoxShape.circle,
//                 ),
//                 selectedDecoration: BoxDecoration(
//                   color: _primaryColor,
//                   shape: BoxShape.circle,
//                 ),
//                 markersAnchor: 0.2,
//                 markerDecoration: BoxDecoration(
//                   color: _dangerColor,
//                   shape: BoxShape.circle,
//                 ),
//                 markerMargin: const EdgeInsets.symmetric(horizontal: 1),
//                 markerSize: 6,
//               ),
//               headerStyle: HeaderStyle(
//                 formatButtonVisible: true,
//                 titleCentered: true,
//                 formatButtonDecoration: BoxDecoration(
//                   color: _primaryColor,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 formatButtonTextStyle: const TextStyle(color: Colors.white),
//                 leftChevronIcon: Icon(Icons.chevron_left, color: _primaryColor),
//                 rightChevronIcon: Icon(Icons.chevron_right, color: _primaryColor),
//               ),
//               daysOfWeekStyle: DaysOfWeekStyle(
//                 weekdayStyle: GoogleFonts.poppins(color: _textSecondary),
//                 weekendStyle: GoogleFonts.poppins(color: _textSecondary),
//               ),
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay;
//                 });
//               },
//               onFormatChanged: (format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               },
//               onPageChanged: (focusedDay) {
//                 _focusedDay = focusedDay;
//               },
//             ),
//             const SizedBox(height: 16),
//             ..._buildEventList(),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildEventList() {
//     if (_selectedDay == null) return [];
    
//     final loans = _getLoansForDay(_selectedDay!);
    
//     if (loans.isEmpty) {
//       return [
//         Text(
//           'No payments due',
//           style: GoogleFonts.poppins(color: _textSecondary),
//         ),
//       ];
//     }

//     return [
//       Text(
//         'Payments due:',
//         style: GoogleFonts.poppins(
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//         ),
//       ),
//       const SizedBox(height: 8),
//       ...loans.map((loan) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         child: Card(
//           elevation: 1,
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.account_balance_wallet,
//                   color: _getStatusColor(loan.status).withOpacity(0.8),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Loan #${loan.id}',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         'Amount: ${_formatCurrency(loan.remainingBalance)}',
//                         style: GoogleFonts.poppins(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: _primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () => _makePayment(loan),
//                   child: Text(
//                     'Pay Now',
//                     style: GoogleFonts.poppins(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     ];
//   }

//   Widget _buildSavingsScreen() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.savings, size: 60, color: _primaryColor),
//           const SizedBox(height: 16),
//           Text(
//             'Savings Account', 
//             style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Balance: ${_formatCurrency(widget.currentSavings)}', 
//             style: GoogleFonts.poppins(fontSize: 24),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Make Deposit', style: GoogleFonts.poppins()),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoansScreen() {
//     if (widget.loans.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.money_off, size: 60, color: _primaryColor),
//             const SizedBox(height: 16),
//             Text(
//               'No Active Loans', 
//               style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'You currently don\'t have any loans',
//               style: GoogleFonts.poppins(color: _textSecondary),
//             ),
//           ],
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: widget.loans.length,
//       itemBuilder: (context, index) {
//         final loan = widget.loans[index];
//         return _buildLoanCard(loan);
//       },
//     );
//   }

//   Widget _buildLoanCard(Loan loan) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Loan #${loan.id}', 
//                   style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//                 ),
//                 Chip(
//                   label: Text(loan.status),
//                   backgroundColor: _getStatusColor(loan.status),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             _buildLoanDetailRow('Amount:', _formatCurrency(loan.amount)),
//             _buildLoanDetailRow('Balance:', _formatCurrency(loan.remainingBalance)),
//             _buildLoanDetailRow('Disbursed:', 
//                 DateFormat('MMM d, y').format(loan.disbursementDate)),
//             _buildLoanDetailRow('Due:', 
//                 DateFormat('MMM d, y').format(loan.dueDate)),
//             const SizedBox(height: 10),
//             if (loan.status == 'Active')
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => _makePayment(loan),
//                   child: const Text('Make Payment'),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTransactionsScreen() {
//     return Center(
//       child: Text(
//         'Transactions History', 
//         style: GoogleFonts.poppins(fontSize: 18)),
//     );
//   }

//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'active': return _successColor.withOpacity(0.2);
//       case 'overdue': return _dangerColor.withOpacity(0.2);
//       case 'completed': return Colors.grey.withOpacity(0.2);
//       default: return Colors.blue.withOpacity(0.2);
//     }
//   }

//   Widget _buildLoanDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Text(
//             '$label ', 
//             style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
//           ),
//           Text(value, style: GoogleFonts.poppins()),
//         ],
//       ),
//     );
//   }

//   Future<void> _submitLoanApplication(Map<String, dynamic> application) async {
//     try {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Loan application submitted successfully!')),
//       );
//       setState(() => _currentIndex = 3);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }

//   void _makePayment(Loan loan) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Make Payment'),
//         content: Text('Payment for Loan #${loan.id}'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Payment processed successfully')),
//               );
//             },
//             child: const Text('Confirm'),
//           ),
//         ],
//       ),
//     );
//   }

//   double _calculateTotalDue() {
//     return widget.loans.fold(0, (sum, loan) => sum + loan.remainingBalance);
//   }

//   String _getAppBarTitle() {
//     switch (_currentIndex) {
//       case 0: return 'Dashboard';
//       case 1: return 'Savings';
//       case 2: return 'Apply Loan';
//       case 3: return 'My Loans';
//       case 4: return 'Transactions';
//       default: return 'Dashboard';
//     }
//   }

//   String _formatCurrency(double amount) {
//     return NumberFormat.currency(symbol: 'UGX ', decimalDigits: 0).format(amount);
//   }
// }

// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:smartloan_sacco/models/deposit_model.dart';
import 'package:smartloan_sacco/pages/loan.dart';
import 'package:smartloan_sacco/models/notification_model.dart';
import 'package:smartloan_sacco/models/transaction_model.dart';
import 'package:smartloan_sacco/pages/feedback_page.dart';
import 'package:smartloan_sacco/models/momo_payment.dart';
// import 'package:smartloan_sacco/models/payment_confirmation.dart';
// import 'package:smartloan_sacco/models/payment_history.dart';

class MemberDashboard extends StatefulWidget {
  const MemberDashboard({super.key});

  @override
  State<MemberDashboard> createState() => _MemberDashboardState();
}

class _MemberDashboardState extends State<MemberDashboard> {
  // Colors for the grid items
  final Color _savingsColor = const Color(0xFF4CAF50); // Green
  final Color _activeLoansColor = const Color(0xFF9C27B0); // Purple
  final Color _overdueColor = const Color(0xFFFF9800); // Orange
  final Color _totalDueColor = const Color(0xFF009688); // Teal
  final Color _primaryColor = Colors.blue;
  final Color _bgColor = const Color(0xFFF5F6FA);
  final Color _textSecondary = const Color.fromARGB(255, 8, 56, 71);

  int _currentIndex = 0;
  final int _unreadNotifications = 2;

  // Mock data
  final double _currentSavings = 250000;
  final List<Loan> _loans = [
    Loan(
      id: 'LN-2023-001',
      amount: 500000,
      remainingBalance: 300000,
      disbursementDate: DateTime(2023, 6, 1),
      dueDate: DateTime.now().add(const Duration(days: 15)), // Real-time due date
      status: 'Active',
      type: 'Personal',
    ),
    Loan(
      id: 'LN-2023-002',
      amount: 300000,
      remainingBalance: 150000,
      disbursementDate: DateTime(2023, 8, 15),
      dueDate: DateTime.now().subtract(const Duration(days: 2)), // Overdue
      status: 'Overdue',
      type: 'Business',
    ),
  ];

  final List<Transaction> _transactions = [
    Transaction(
      id: 'TR-2023-001',
      amount: 50000,
      date: DateTime(2023, 10, 1),
      type: 'Deposit',
      status: 'Completed',
      method: 'Mobile Money',
    ),
  ];

  final List<AppNotification> _notifications = [
    AppNotification(
      id: 'NT-001',
      title: 'Payment Due',
      message: 'Your loan payment of UGX 50,000 is due soon',
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.payment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final activeLoans = _loans.where((loan) => loan.status == 'Active').length;
    final overdueLoans = _loans.where((loan) => loan.status == 'Overdue').length;
    final totalDue = _calculateTotalDue();

    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text(
          _getAppBarTitle(),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: _primaryColor,
        elevation: 0,
        actions: _currentIndex == 0 ? [_buildNotificationBadge()] : null,
      ),
      body: _getCurrentScreen(activeLoans, overdueLoans, totalDue),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _currentIndex == 3 ? FloatingActionButton(
        onPressed: _submitFeedback,
        child: const Icon(Icons.feedback),
      ) : null,
    );
  }

  Widget _buildNotificationBadge() {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: _showNotifications,
        ),
        if (_unreadNotifications > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$_unreadNotifications',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _getCurrentScreen(int activeLoans, int overdueLoans, double totalDue) {
    switch (_currentIndex) {
      case 0: return _buildHomeScreen(activeLoans, overdueLoans, totalDue);
      case 1: return _buildSavingsScreen();
      case 2: return _buildTransactionsScreen();
      case 3: return _buildNotificationsScreen();
      default: return _buildHomeScreen(activeLoans, overdueLoans, totalDue);
    }
  }

  Widget _buildHomeScreen(int activeLoans, int overdueLoans, double totalDue) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 20),
          _buildStatsGrid(_currentSavings, activeLoans, overdueLoans, totalDue),
          const SizedBox(height: 20),
          _buildDuePaymentsSection(),
          const SizedBox(height: 20),
          _buildRecentTransactions(),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(double savings, int activeLoans, int overdueLoans, double totalDue) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildStatCard('Savings', _formatCurrency(savings), _savingsColor),
        _buildStatCard('Active Loans', activeLoans.toString(), _activeLoansColor),
        _buildStatCard('Overdue', overdueLoans.toString(), _overdueColor),
        _buildStatCard('Total Due', _formatCurrency(totalDue), _totalDueColor),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      color: color,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDuePaymentsSection() {
    final duePayments = _loans.where((loan) => 
        loan.status == 'Active' || loan.status == 'Overdue').toList();

    if (duePayments.isEmpty) {
      return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.check_circle, size: 50, color: Colors.green),
              const SizedBox(height: 16),
              Text(
                'No Due Payments',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'You have no active or overdue loans at this time',
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Repayments Due',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...duePayments.map((loan) => _buildLoanDueCard(loan)),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanDueCard(Loan loan) {
    final isOverdue = loan.status == 'Overdue';
    final daysRemaining = loan.dueDate.difference(DateTime.now()).inDays;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOverdue 
            ? _overdueColor.withOpacity(0.1)
            : _activeLoansColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isOverdue ? _overdueColor : _activeLoansColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Loan #${loan.id}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                isOverdue 
                    ? '${-daysRemaining} days overdue'
                    : '$daysRemaining days remaining',
                style: GoogleFonts.poppins(
                  color: isOverdue ? _overdueColor : _activeLoansColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildLoanDetailRow('Amount Due:', _formatCurrency(loan.remainingBalance)),
          _buildLoanDetailRow('Due Date:', DateFormat('MMM d, y').format(loan.dueDate)),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _makePayment(loan),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryColor,
              ),
              child: const Text('Make Payment'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    final recentTransactions = _transactions.take(3).toList();
    
    if (recentTransactions.isEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => setState(() => _currentIndex = 2),
                  child: const Text('View All'),
                ),
              ],
            ),
            ...recentTransactions.map((txn) => _buildTransactionItem(txn)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Transaction txn) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        txn.type == 'Deposit' ? Icons.arrow_downward : Icons.arrow_upward,
        color: txn.type == 'Deposit' ? Colors.green : Colors.red,
      ),
      title: Text(
        '${txn.type} - ${_formatCurrency(txn.amount)}',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        '${DateFormat('MMM d').format(txn.date)} • ${txn.method}',
      ),
      trailing: Chip(
        label: Text(txn.status),
        backgroundColor: _getStatusColor(txn.status),
      ),
    );
  }

  Widget _buildSavingsScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 20),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.savings, size: 60, color: _primaryColor),
                  const SizedBox(height: 16),
                  Text(
                    'Savings Account Balance',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatCurrency(_currentSavings),
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showDepositDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Make Deposit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildTransactionHistory(),
        ],
      ),
    );
  }

  Future<void> _showDepositDialog() async {
    final amountController = TextEditingController();
    final methodController = TextEditingController(text: 'Mobile Money');

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Make Deposit'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount (UGX)',
                prefixText: 'UGX ',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: methodController.text,
              items: const [
                DropdownMenuItem(value: 'Mobile Money', child: Text('Mobile Money')),
                DropdownMenuItem(value: 'Bank Transfer', child: Text('Bank Transfer')),
              ],
              onChanged: (value) => methodController.text = value!,
              decoration: const InputDecoration(
                labelText: 'Payment Method',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0;
              if (amount > 0) {
                if (methodController.text == 'Mobile Money') {
                  Navigator.pop(context);
                  _initiateMobileMoneyPayment(amount);
                } else {
                  _processDeposit(amount, methodController.text);
                  Navigator.pop(context);
                }
              }
            },
            child: const Text('Deposit'),
          ),
        ],
      ),
    );
  }

  void _initiateMobileMoneyPayment(double amount) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MomoPaymentPage(amount: amount),
      ),
    ).then((result) {
      if (result != null && result['success'] == true) {
        _processDeposit(amount, 'Mobile Money');
      }
    });
  }

  Future<void> _processDeposit(double amount, String method) async {
    // In real app, this would call your API
    setState(() {
      _transactions.insert(0, Transaction(
        id: 'TR-${DateTime.now().millisecondsSinceEpoch}',
        amount: amount,
        date: DateTime.now(),
        type: 'Deposit',
        status: 'Completed',
        method: method,
        phoneNumber: '0700000000', // Replace with actual phone number if available
      ));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deposit of ${_formatCurrency(amount)} successful')),
    );
  }

  Widget _buildTransactionHistory() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ..._transactions.take(5).map((txn) => _buildTransactionItem(txn)),
            if (_transactions.length > 5)
              TextButton(
                onPressed: () => setState(() => _currentIndex = 2),
                child: const Text('View All Transactions'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction History',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: _filterTransactions,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) => _buildTransactionCard(_transactions[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(Transaction txn) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(
          txn.type == 'Deposit' ? Icons.arrow_downward : Icons.arrow_upward,
          color: txn.type == 'Deposit' ? Colors.green : Colors.red,
        ),
        title: Text(
          '${txn.type} - ${_formatCurrency(txn.amount)}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '${DateFormat('MMM d, y').format(txn.date)} • ${txn.method}',
        ),
        trailing: Chip(
          label: Text(txn.status),
          backgroundColor: _getStatusColor(txn.status),
        ),
        onTap: () => _showTransactionDetails(txn),
      ),
    );
  }

  Widget _buildNotificationsScreen() {
    return ListView.builder(
      itemCount: _notifications.length,
      itemBuilder: (context, index) => _buildNotificationCard(_notifications[index]),
    );
  }

  Widget _buildNotificationCard(AppNotification notification) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(
          notification.type == NotificationType.payment ? Icons.payment : Icons.info,
          color: _primaryColor,
        ),
        title: Text(notification.title),
        subtitle: Text(notification.message),
        trailing: Text(DateFormat('MMM d').format(notification.date)),
        onTap: () => _viewNotification(notification),
      ),
    );
  }

  void _viewNotification(AppNotification notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification.title),
        content: Text(notification.message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showNotifications() {
    setState(() => _currentIndex = 3);
  }

  void _submitFeedback() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FeedbackPage()),
    );
  }

  void _makePayment(Loan loan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MomoPaymentPage(amount: loan.remainingBalance),
      ),
    ).then((result) {
      if (result != null && result['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment initiated successfully')),
        );
      }
    });
  }

  void _showTransactionDetails(Transaction txn) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Transaction Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('ID:', txn.id),
            _buildDetailRow('Type:', txn.type),
            _buildDetailRow('Amount:', _formatCurrency(txn.amount)),
            _buildDetailRow('Date:', DateFormat('MMM d, y').format(txn.date)),
            _buildDetailRow('Method:', txn.method),
            _buildDetailRow('Status:', txn.status),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _filterTransactions() {
    // Implement filtering logic
  }

  Widget _buildHeaderSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(Icons.person, size: 30),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Member',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'member@sacco.com',
              style: GoogleFonts.poppins(
                color: _textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      selectedItemColor: _primaryColor,
      unselectedItemColor: _textSecondary,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Transactions'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  double _calculateTotalDue() {
    return _loans.fold(0, (sum, loan) => sum + loan.remainingBalance);
  }

  Widget _buildLoanDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label ',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          Text(value, style: GoogleFonts.poppins()),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed': return Colors.green.withOpacity(0.2);
      case 'pending': return Colors.orange.withOpacity(0.2);
      case 'failed': return Colors.red.withOpacity(0.2);
      default: return Colors.grey.withOpacity(0.2);
    }
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0: return 'Dashboard';
      case 1: return 'Savings';
      case 2: return 'Transactions';
      case 3: return 'Notifications';
      default: return 'Dashboard';
    }
  }

  String _formatCurrency(double amount) {
    return NumberFormat.currency(symbol: 'UGX ', decimalDigits: 0).format(amount);
  }
}