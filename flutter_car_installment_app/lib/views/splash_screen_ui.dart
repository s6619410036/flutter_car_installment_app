import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_car_installment_app/views/car_installment_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    super.initState();

    // ตั้งเวลาเปลี่ยนหน้า 3 วินาที
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CarInstallmentUi()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CAF50), // สีเขียว
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // รูป
              Image.asset('assets/images/installment.png', width: 180),

              const SizedBox(height: 30),

              // ข้อความหัวข้อ
              const Text(
                'Car Installment',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB2FF59),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'คำนวณค่างวดรถยนต์',
                style: TextStyle(fontSize: 22, color: Color(0xFFB2FF59)),
              ),

              const SizedBox(height: 40),

              // วงโหลด
              const CircularProgressIndicator(color: Colors.white),

              const SizedBox(height: 60),

              // ข้อความด้านล่าง
              const Text(
                'Created by Pimpikun DTI-SAU',
                style: TextStyle(color: Color(0xFFB2FF59), fontSize: 14),
              ),

              const SizedBox(height: 5),

              const Text(
                'Version 1.0.0',
                style: TextStyle(color: Color(0xFFB2FF59), fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
