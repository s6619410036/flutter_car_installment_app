import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController interestCtrl = TextEditingController();

  int downPayment = 10;
  int period = 24;

  double result = 0.0;

  final formatMoney = NumberFormat("#,##0.00");

  calculate() {
    double price = double.parse(priceCtrl.text);
    double interest = double.parse(interestCtrl.text);

    double downAmount = price * downPayment / 100;

    double loan = price - downAmount;

    double totalInterest = loan * (interest / 100) * (period / 12);

    double perMonth = (loan + totalInterest) / period;

    setState(() {
      result = perMonth;
    });
  }

  reset() {
    setState(() {
      priceCtrl.clear();
      interestCtrl.clear();
      downPayment = 10;
      period = 24;
      result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CI Calculator'), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'คำนวณค่างวดรถ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/images/shopping.png', height: 150),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: priceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ราคารถ (บาท)',
                border: OutlineInputBorder(),
                hintText: '0.00',
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('จำนวนเงินดาวน์ (%)', style: TextStyle(fontSize: 16)),
            ),

            Row(
              children: [
                radioDown(10),
                radioDown(20),
                radioDown(30),
                radioDown(40),
                radioDown(50),
              ],
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField(
              value: period,
              decoration: const InputDecoration(
                labelText: 'ระยะเวลาผ่อน (เดือน)',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 24, child: Text('24 เดือน')),
                DropdownMenuItem(value: 36, child: Text('36 เดือน')),
                DropdownMenuItem(value: 48, child: Text('48 เดือน')),
                DropdownMenuItem(value: 60, child: Text('60 เดือน')),
                DropdownMenuItem(value: 72, child: Text('72 เดือน')),
              ],
              onChanged: (value) {
                setState(() {
                  period = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: interestCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'อัตราดอกเบี้ย (%/ปี)',
                border: OutlineInputBorder(),
                hintText: '0.00',
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: calculate,
                    child: const Text('คำนวณ'),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: reset,
                    child: const Text('ยกเลิก'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    'ค่างวดรถต่อเดือนเป็นเงิน',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    formatMoney.format(result),
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text('บาทต่อเดือน', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioDown(int value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: downPayment,
          onChanged: (val) {
            setState(() {
              downPayment = val!;
            });
          },
        ),
        Text('$value'),
      ],
    );
  }
}
