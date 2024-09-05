import 'package:billingsoftware/home_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Billing Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const CreateInvoiceScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  void _login(BuildContext context) {
    // Add authentication logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Customers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CustomerListScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Invoices'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InvoiceListScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}



class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: const Center(
        child: Text('List of Customers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add navigation to AddCustomerScreen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}




class InvoiceListScreen extends StatelessWidget {
  const InvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: const Center(
        child: Text('List of Invoices'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add navigation to CreateInvoiceScreen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
      ),
      body: const Center(
        child: Text('Profile Settings Form'),
      ),
    );
  }
}


class Customer {
  final String id;
  final String name;
  final String contactInfo;
  final String billingAddress;

  Customer({
    required this.id,
    required this.name,
    required this.contactInfo,
    required this.billingAddress,
  });
}

class AuthService {
  // Mock authentication function
  Future<bool> login(String username, String password) async {
    // Add actual authentication logic here
    return Future.delayed(const Duration(seconds: 1), () => username == 'admin' && password == 'admin');
  }
}


class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}


class AppConstants {
  static const Color primaryColor = Colors.blue;
  static const String appName = 'Billing Software';
}
