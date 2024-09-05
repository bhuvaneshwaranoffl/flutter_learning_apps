
import 'package:flutter/material.dart';
import 'package:menu_bar/menu_bar.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  _CreateInvoiceScreenState createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  final List<Product> _products = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  void _addProduct() {
    final String name = _nameController.text;
    final double? price = double.tryParse(_priceController.text);
    final int? quantity = int.tryParse(_quantityController.text);

    if (name.isNotEmpty && price != null && quantity != null) {
      setState(() {
        _products.add(Product(name: name, price: price, quantity: quantity));
      });
      _nameController.clear();
      _priceController.clear();
      _quantityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuBarWidget(
      barStyle: const MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.indigo),
        shadowColor: WidgetStatePropertyAll(Colors.indigo)
      ),
      barButtons: [
        BarButton(
          text: const Text('File', style: TextStyle(color: Colors.white)),
          submenu: SubMenu(
            menuItems: [
              MenuButton(
                text: const Text('Save'),
                onTap: () {},
                icon: const Icon(Icons.save),
                shortcutText: 'Ctrl+S',
              ),
              const MenuDivider(),
              MenuButton(
                text: const Text('Exit'),
                onTap: () {},
                icon: const Icon(Icons.exit_to_app),
                shortcutText: 'Ctrl+Q',
              ),
            ],
          ),
        ),
        BarButton(
          text: const Text('Help', style: TextStyle(color: Colors.white)),
          submenu: SubMenu(
            menuItems: [
              MenuButton(
                text: const Text('View License'),
                onTap: () {},
              ),
              MenuButton(
                text: const Text('About'),
                onTap: () {},
                icon: const Icon(Icons.info),
              ),
            ],
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Invoice'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  // color: Colors.blue.shade900,
                  decoration: BoxDecoration(
                    gradient: LinearGradient
                    (colors:
                    [
                      Colors.blue.shade900,
                      Colors.blue.shade900,
                      Colors.blue.shade600,
                      Colors.blue.shade400,
                      Colors.blue.shade900,
                    ],begin: Alignment.bottomLeft,
                    end: Alignment.topRight)
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Company name",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Billing Address:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text("123 Main St"),
                      const Text("City, State, ZIP"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle customer selection or creation
                        },
                        child: const Text('Select Customer'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle adding notes
                        },
                        child: const Text('Add Notes'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
             Expanded(
              flex: 9,
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                  children: [
                     
                      const SizedBox(height: 20),
                      _buildProductForm(),
                      const SizedBox(height: 20),
                      DataTable(
                        decoration: const BoxDecoration(
                          color:Colors.indigo
                        ),
                        columns: const [
                          DataColumn(label: Text('Product Name')),
                          DataColumn(label: Text('Price')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Total')),
                        ],
                        rows: _products.map((product) {
                          return DataRow(
                            color: WidgetStatePropertyAll(
                                  Colors.indigo.shade300),
                            cells: [
                            DataCell(Text(product.name)),
                            DataCell(Text(product.price.toStringAsFixed(2))),
                            DataCell(Text(product.quantity.toString())),
                            DataCell(Text((product.price * product.quantity)
                                .toStringAsFixed(2))),
                          ]);
                        }).toList(),
                      ),
                      Row(
                 
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle invoice creation
                            },
                            child: const Text('Create Invoice'),
                          ),
                          _buildTotal(),
                        ],
                      ),
                  ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration:InputDecoration(labelText: 'Product Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _priceController,
            decoration:  InputDecoration(labelText: 'Price',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _quantityController,
            decoration:  InputDecoration(labelText: 'Quantity',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )),
            keyboardType: TextInputType.number,
          ),
        ),
        // IconButton(
        //   icon: const Icon(Icons.add),
        //   onPressed: _addProduct,
        // ),
        ElevatedButton(onPressed: _addProduct, child:const Text("Add Product"))
      ],
    );
  }
  Widget _buildTotal() {
double total = _products.fold(
0, (sum, product) => sum + (product.price * product.quantity));
return Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Text(
'Total: ${total.toStringAsFixed(2)}',
style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
],
);
}
}

class Product {
  final String name;
  final double price;
  final int quantity;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
