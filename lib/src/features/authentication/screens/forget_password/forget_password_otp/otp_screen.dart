import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kDefaultSizes),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(kAppName, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 80.0)),
            Text(kOTPScreenTitle.toUpperCase(), style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0)),
            Text('$kOTPScreenSubTitle (tharupathi02@gmail.com)', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
            const SizedBox(height: 20.0,),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              autoFocus: true,
              focusedBorderColor: kPrimaryColor,
              onSubmit: (String verificationCode) {},
            ),
            const SizedBox(height: 20.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(kOTPScreenVerifyOTP.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
