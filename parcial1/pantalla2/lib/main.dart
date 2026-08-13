import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFF6F7F9);
const kLima = Color(0xFFD4F550);
const kTexto = Colors.black;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kFondo,
        appBar: AppBar(
          backgroundColor: kFondo,
          elevation: 0,
          leading: const Icon(Icons.arrow_back_ios_new, color: kTexto, size: 18),
          centerTitle: true,
          title: const Text(
            'Add money',
            style: TextStyle(color: kTexto, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Select card',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 145,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20.0, right: 8.0),
                  children: const [
                    MiTarjeta(
                      color: kLima,
                      textoColor: Colors.black,
                      tipo: 'Debit card',
                      numero: '•••• 4568',
                      marca: 'MASTERCARD',
                      seleccionada: true,
                    ),
                    SizedBox(width: 12),
                    MiTarjeta(
                      color: Color(0xFF1A1A1A),
                      textoColor: Colors.white,
                      tipo: 'Credit card',
                      numero: '•••• 2478',
                      marca: 'VISA',
                    ),
                    SizedBox(width: 12),
                    MiTarjeta(
                      color: Color(0xFF333333),
                      textoColor: Colors.white,
                      tipo: 'Bank',
                      numero: '••••',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Add money to Neobank',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: const [
                    MiOpcion(icon: Icons.sync, title: 'Move your direct deposit'),
                    SizedBox(height: 10),
                    MiOpcion(icon: Icons.swap_horiz, title: 'Transfer from other banks'),
                    SizedBox(height: 10),
                    MiOpcion(icon: Icons.apple, title: 'Apple Pay'),
                    SizedBox(height: 10),
                    MiOpcion(icon: Icons.credit_card, title: 'Debit / Credit Card'),
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

class MiTarjeta extends StatelessWidget {
  final Color color;
  final Color textoColor;
  final String numero;
  final String? tipo;
  final String? marca;
  final bool seleccionada;

  const MiTarjeta({
    super.key,
    required this.color,
    required this.textoColor,
    required this.numero,
    this.tipo,
    this.marca,
    this.seleccionada = false,
  });

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double anchoTarjeta = (anchoPantalla * 0.42).clamp(130.0, 220.0);

    Widget tarjetaInterna = Container(
      width: anchoTarjeta,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: seleccionada ? Colors.black : Colors.white,
                ),
                child: seleccionada
                    ? const Center(
                        child: Icon(Icons.circle, size: 9, color: Color.fromARGB(255, 251, 251, 251)),
                      )
                    : null,
              ),
              if (marca != null)
                Text(
                  marca!,
                  style: TextStyle(
                    color: textoColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tipo != null) ...[
                Text(
                  tipo!,
                  style: TextStyle(
                    fontSize: 15,
                    color: seleccionada ? Colors.black54 : Colors.white60,
                  ),
                ),
                const SizedBox(height: 2),
              ],
              Text(
                numero,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textoColor),
              ),
            ],
          ),
        ],
      ),
    );

    if (seleccionada) {
      return Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: tarjetaInterna,
      );
    }

    return tarjetaInterna;
  }
}

class MiOpcion extends StatelessWidget {
  final IconData icon;
  final String title;

  const MiOpcion({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: ListTile(
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F2F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.black87, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
      ),
    );
  }
}