import 'package:flutter/material.dart';

void main() {
  runApp(const FocusApp());
}

const kFondo = Color(0xFF0D131A);
const kSuperficie = Color(0xFF161F28);
const kSuperficieVar = Color(0xFF1E293B);
const kBorde = Color(0xFF2A364F);
const kTexto = Color(0xFFF8FAFC);
const kMuted = Color(0xFF94A3B8);
const kAcentoVerde = Color(0xFF10B981);
const kAcentoCian = Color(0xFF06B6D4);

class FocusApp extends StatelessWidget {
  const FocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'focus_app',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kFondo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _pendientes = [
    {
      'titulo': 'Reporte de Bioquímica',
      'subtitulo': 'Lab 2 · Entregar borrador',
      'etiqueta': 'Bioquímica',
      'completado': false,
    },
    {
      'titulo': 'Lectura de Dietética',
      'subtitulo': 'Capítulo 4: Macronutrientes',
      'etiqueta': 'Dietética',
      'completado': false,
    },
    {
      'titulo': 'Repaso para Quiz',
      'subtitulo': 'Anatomía · Tema 3',
      'etiqueta': 'Anatomía',
      'completado': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFondo,
        elevation: 0,
        title: const Text(
          'focus_app',
          style: TextStyle(
            color: kTexto,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Center(
              child: Text(
                'Hola!',
                style: TextStyle(
                  color: kAcentoCian,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSuperficie,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kBorde),
                  boxShadow: [
                    BoxShadow(
                      color: kAcentoVerde.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: kAcentoVerde,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'VENTANA LIBRE ACTIVA',
                              style: TextStyle(
                                color: kMuted,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.timer_outlined, color: kMuted, size: 18),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '3 horas, 30 min',
                      style: TextStyle(
                        color: kTexto,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 6,
                        backgroundColor: kSuperficieVar,
                        valueColor: AlwaysStoppedAnimation<Color>(kAcentoVerde),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  splashColor: kAcentoVerde.withValues(alpha: 0.2),
                  child: Ink(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kAcentoVerde, kAcentoCian],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kAcentoVerde.withValues(alpha: 0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_circle_outline_rounded, size: 44, color: Colors.black),
                        SizedBox(height: 6),
                        Text(
                          'INICIAR BLOQUE DE ESTUDIO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pendientes para hoy',
                    style: TextStyle(
                      color: kTexto,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_pendientes.where((e) => e['completado'] as bool).length}/${_pendientes.length} listos',
                    style: const TextStyle(
                      color: kMuted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _pendientes.length,
                  itemBuilder: (context, index) {
                    final item = _pendientes[index];
                    final bool completado = item['completado'];

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: completado ? kSuperficie.withValues(alpha: 0.5) : kSuperficie,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: completado ? Colors.transparent : kBorde,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        leading: Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            value: completado,
                            activeColor: kAcentoVerde,
                            checkColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: const BorderSide(color: kMuted, width: 1.5),
                            onChanged: (bool? val) {
                              setState(() {
                                _pendientes[index]['completado'] = val ?? false;
                              });
                            },
                          ),
                        ),
                        title: Text(
                          item['titulo'],
                          style: TextStyle(
                            color: completado ? kMuted : kTexto,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            decoration: completado ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        subtitle: Text(
                          item['subtitulo'],
                          style: TextStyle(
                            color: kMuted,
                            fontSize: 12,
                            decoration: completado ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: kSuperficieVar,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item['etiqueta'],
                            style: const TextStyle(
                              color: kAcentoCian,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}