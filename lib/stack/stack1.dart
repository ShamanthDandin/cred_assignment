import 'package:cred_assignment/utils/colors.dart';
import 'package:cred_assignment/components/createplanbtn.dart';
import 'package:cred_assignment/components/smallcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import GoogleFonts

class SimplePage extends StatelessWidget {
  final Function onexit1;
  final Function onnext;
  final Map<String, dynamic>? stack2;

  const SimplePage({
    super.key,
    required this.onexit1,
    required this.onnext,
    required this.stack2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onexit1(),
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Container(
              color: AppColors.stack1,
              width: MediaQuery.of(context).size.width,
              height: 650,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      stack2?['open_state']['body']['title'] ?? 'No Title',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      stack2?['open_state']['body']['subtitle'] ?? 'No Title',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 170,
                    width: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          stack2?['open_state']?['body']?['items']?.length ?? 0,
                      itemBuilder: (context, index) {
                        final item =
                            stack2?['open_state']?['body']?['items']?[index];

                        // Get dynamic values from stack2 for each repayment plan
                        String title = item?['emi']?.toString() ?? 'No EMI';
                        String subtitle =
                            item?['duration']?.toString() ?? 'No Duration';
                        bool isRecommended = item?['tag'] == 'recommended';

                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 16 : 12,
                            right: index ==
                                    (stack2?['open_state']?['body']?['items']
                                                ?.length ??
                                            1) -
                                        1
                                ? 16
                                : 0,
                          ),
                          child: RepaymentPlanCard(
                            title: title,
                            subtitle: subtitle,
                            isRecommended: isRecommended,
                            isSelected:
                                index == 0, // Select the first item by default
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: CreatePlanButton(
                      onTap: () {
                        print("Create your own plan button tapped");
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        onnext();
                        print("Button Pressed");
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            stack2?['cta_text'] ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
