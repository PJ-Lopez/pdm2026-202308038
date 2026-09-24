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
      title: 'Marcador Deportivo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        useMaterial3: true,
      ),
      home: const MarcadorScreen(),
    );
  }
}

class MarcadorScreen extends StatefulWidget {
  const MarcadorScreen({super.key});

  @override
  State<MarcadorScreen> createState() => _MarcadorScreenState();
}

class _MarcadorScreenState extends State<MarcadorScreen> {
  int _puntosA = 0;
  int _puntosB = 0;

  void _modificarPuntosA(int delta) {
    setState(() {
      if (_puntosA + delta >= 0) {
        _puntosA += delta;
      }
    });
  }

  void _modificarPuntosB(int delta) {
    setState(() {
      if (_puntosB + delta >= 0) {
        _puntosB += delta;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _puntosA = 0;
      _puntosB = 0;
    });
  }

  String _obtenerMensaje() {
    if (_puntosA > _puntosB) return 'Va ganando Equipo A';
    if (_puntosB > _puntosA) return 'Va ganando Equipo B';
    return 'Empate';
  }

  @override
  Widget build(BuildContext context) {
    final bool ganaA = _puntosA > _puntosB;
    final bool ganaB = _puntosB > _puntosA;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador Deportivo'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              // Banner dinámico de estado
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: (ganaA || ganaB) ? const Color(0xFFE8F5E9) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: (ganaA || ganaB) ? Colors.green : const Color(0xFFD1D5DB),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  _obtenerMensaje(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (ganaA || ganaB) ? Colors.green.shade800 : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Marcadores en Row
              Row(
                children: [
                  _TarjetaEquipo(
                    nombre: 'Equipo A',
                    puntos: _puntosA,
                    esLider: ganaA,
                    onSumar: () => _modificarPuntosA(1),
                    onRestar: () => _modificarPuntosA(-1),
                  ),
                  const SizedBox(width: 14),
                  _TarjetaEquipo(
                    nombre: 'Equipo B',
                    puntos: _puntosB,
                    esLider: ganaB,
                    onSumar: () => _modificarPuntosB(1),
                    onRestar: () => _modificarPuntosB(-1),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Botón Reiniciar
              FilledButton.tonalIcon(
                onPressed: _reiniciar,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Reiniciar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TarjetaEquipo extends StatelessWidget {
  final String nombre;
  final int puntos;
  final bool esLider;
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  const _TarjetaEquipo({
    required this.nombre,
    required this.puntos,
    required this.esLider,
    required this.onSumar,
    required this.onRestar,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: esLider ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: esLider ? Colors.green : const Color(0xFFD1D5DB),
            width: esLider ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          children: [
            Text(
              nombre,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: esLider ? Colors.green.shade800 : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$puntos',
              style: TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
                color: esLider ? Colors.green.shade800 : Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: onRestar,
                  icon: const Icon(Icons.remove),
                  tooltip: '-1',
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: onSumar,
                  icon: const Icon(Icons.add),
                  tooltip: '+1',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}