import 'package:flutter/material.dart';

void main() {
  runApp(const CafeteriaApp());
}

class CafeteriaApp extends StatelessWidget {
  const CafeteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafetería',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const PedidoPage(),
    );
  }
}

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int _cantidadCafe = 0;
  int _cantidadSandwich = 0;
  int _cantidadJugo = 0;

  final double _precioCafe = 10.00;
  final double _precioSandwich = 25.00;
  final double _precioJugo = 12.00;

  double get _totalPedido {
    return (_cantidadCafe * _precioCafe) +
        (_cantidadSandwich * _precioSandwich) +
        (_cantidadJugo * _precioJugo);
  }

  void _incrementarCafe() {
    setState(() {
      _cantidadCafe++;
    });
  }

  void _decrementarCafe() {
    if (_cantidadCafe > 0) {
      setState(() {
        _cantidadCafe--;
      });
    }
  }

  void _incrementarSandwich() {
    setState(() {
      _cantidadSandwich++;
    });
  }

  void _decrementarSandwich() {
    if (_cantidadSandwich > 0) {
      setState(() {
        _cantidadSandwich--;
      });
    }
  }

  void _incrementarJugo() {
    setState(() {
      _cantidadJugo++;
    });
  }

  void _decrementarJugo() {
    if (_cantidadJugo > 0) {
      setState(() {
        _cantidadJugo--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pedido'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProductoPedido(
                      nombre: 'Café',
                      precio: _precioCafe,
                      cantidad: _cantidadCafe,
                      onIncrementar: _incrementarCafe,
                      onDecrementar: _decrementarCafe,
                    ),
                    const Divider(height: 1),
                    ProductoPedido(
                      nombre: 'Sándwich',
                      precio: _precioSandwich,
                      cantidad: _cantidadSandwich,
                      onIncrementar: _incrementarSandwich,
                      onDecrementar: _decrementarSandwich,
                    ),
                    const Divider(height: 1),
                    ProductoPedido(
                      nombre: 'Jugo',
                      precio: _precioJugo,
                      cantidad: _cantidadJugo,
                      onIncrementar: _incrementarJugo,
                      onDecrementar: _decrementarJugo,
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Q${_totalPedido.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reutilizable ProductoPedido
class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback onIncrementar;
  final VoidCallback onDecrementar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.onIncrementar,
    required this.onDecrementar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Q${precio.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 18),
                  onPressed: cantidad > 0 ? onDecrementar : null,
                  splashRadius: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$cantidad',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 18),
                  onPressed: onIncrementar,
                  splashRadius: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}