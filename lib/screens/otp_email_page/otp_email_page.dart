import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_mart/consts/app_paths.dart';

import '../login_page/login_page.dart';

class OtpEmailPage extends StatefulWidget {
  const OtpEmailPage({super.key});

  @override
  State<OtpEmailPage> createState() => _OtpEmailPageState();
}

class _OtpEmailPageState extends State<OtpEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            buildRow1(context),
            SizedBox(height: 12),
            Divider(color: Colors.grey.shade300, thickness: 0.5),
            buildContainer2(context),
            SizedBox(height: 24),
            buildContainer1(context),
          ],
        ),
      ),
    );
  }

  Row buildRow1(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(AppPath.ic_back),
        ),
        SizedBox(width: 12),
        Text(
          'Verification Code',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1C1B1B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Container buildContainer2(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Email Verification',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF1C1B1B),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'Enter the 6-digit verification code send to your\nemail address.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6F7384),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTextField(context),
              buildTextField(context),
              buildTextField(context),
              buildTextField(context),
              buildTextField(context),
              buildTextField(context),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Resend Code',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF21D4B4),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container buildContainer1(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          );
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF1C1B1B),
          ),
          child: Center(
            child: Text(
              'Proceed',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border(
          top: BorderSide(color: Color(0xFF21D4B4), width: 1),
          left: BorderSide(color: Color(0xFF21D4B4), width: 1),
          bottom: BorderSide(color: Color(0xFF21D4B4), width: 1),
          right: BorderSide(color: Color(0xFF21D4B4), width: 1),
        ),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (values) {
            if (values.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }
}
