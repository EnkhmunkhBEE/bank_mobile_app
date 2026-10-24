import 'package:flutter/material.dart';
import 'package:bank_app/core/theme/app_thene.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hideBalance = false;

  // Mock data
  final _actions = const [
    (Icons.arrow_upward, 'Send'),
    (Icons.receipt_long, 'Pay'),
    (Icons.add_card, 'Top up'),
    (Icons.grid_view, 'More'),
  ];

  final _transactions = const [
    ('Coffee Shop', 'Today, 9:41 AM', -4.50, Icons.local_cafe),
    ('Salary', 'Yesterday', 2000.00, Icons.account_balance_wallet),
    ('Netflix', 'Oct 22', -12.99, Icons.movie),
    ('Grocery Store', 'Oct 21', -56.30, Icons.shopping_cart),
    ('Transfer from Sam', 'Oct 20', 150.00, Icons.swap_horiz),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildBalanceCard(),
              const SizedBox(height: 24),
              _buildQuickActions(),
              const SizedBox(height: 28),
              _buildSectionTitle('My cards'),
              const SizedBox(height: 12),
              _buildCards(),
              const SizedBox(height: 28),
              _buildSectionTitle('Recent transactions', action: 'See all'),
              const SizedBox(height: 8),
              ..._transactions.map(_buildTransactionTile),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Header ----------
  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: AppTheme.primary,
          child: Text('M', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: TextStyle(color: Colors.grey)),
              Text(
                'Mokuu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }

  // ---------- Balance card ----------
  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppTheme.primary, Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total balance',
                style: TextStyle(color: Colors.white70),
              ),
              IconButton(
                onPressed: () => setState(() => _hideBalance = !_hideBalance),
                icon: Icon(
                  _hideBalance ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Text(
            _hideBalance ? '••••••' : '\$12,450.00',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '**** **** **** 4821',
            style: TextStyle(color: Colors.white70, letterSpacing: 1.5),
          ),
        ],
      ),
    );
  }

  // ---------- Quick actions ----------
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _actions.map((a) {
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(a.$1, color: AppTheme.primary),
            ),
            const SizedBox(height: 8),
            Text(a.$2, style: const TextStyle(fontSize: 13)),
          ],
        );
      }).toList(),
    );
  }

  // ---------- Section title ----------
  Widget _buildSectionTitle(String title, {String? action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (action != null)
          Text(action, style: const TextStyle(color: AppTheme.primary)),
      ],
    );
  }

  // ---------- Cards carousel ----------
  Widget _buildCards() {
    final colors = [
      [const Color(0xFF111827), const Color(0xFF374151)],
      [const Color(0xFF7C3AED), const Color(0xFFA78BFA)],
    ];
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) => Container(
          width: 250,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(colors: colors[i]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                i == 0 ? 'Debit' : 'Credit',
                style: const TextStyle(color: Colors.white70),
              ),
              const Text(
                '**** 4821',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
              const Text('12/28', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Transaction tile ----------
  Widget _buildTransactionTile((String, String, double, IconData) t) {
    final isIncome = t.$3 > 0;
    final color = isIncome ? AppTheme.income : AppTheme.expense;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(t.$4, color: Colors.black87),
      ),
      title: Text(t.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(t.$2),
      trailing: Text(
        '${isIncome ? '+' : '-'}\$${t.$3.abs().toStringAsFixed(2)}',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
