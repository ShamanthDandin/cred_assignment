import 'package:cred_assignment/utils/colors.dart';
import 'package:cred_assignment/components/createplanbtn.dart';
import 'package:cred_assignment/components/smallcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import GoogleFonts

class SimplePage extends StatefulWidget {
  final Function onexit1;
  final Function onnext;
  final Map<String, dynamic>? stack2;
  bool? stackfinal;

  SimplePage({
    super.key,
    required this.onexit1,
    required this.onnext,
    required this.stack2,
    this.stackfinal,
  });

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  void changestate() {
    widget.stackfinal = !widget.stackfinal!;
    setState(() {});
  }

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
                onTap: () => widget.onexit1(),
                child: Container(
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            widget.stackfinal!
                ? Container(
                    color: AppColors.stack1,
                    width: MediaQuery.of(context).size.width,
                    height: 650,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 6),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "EMI",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF6E6E6E),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "₹4,247 /mo",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "duration",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF6E6E6E),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "12 months",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
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
                            widget.stack2?['open_state']['body']['title'] ??
                                'No Title',
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
                            widget.stack2?['open_state']['body']['subtitle'] ??
                                'No Title',
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
                            itemCount: widget
                                    .stack2?['open_state']?['body']?['items']
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final item = widget.stack2?['open_state']?['body']
                                  ?['items']?[index];

                              String title =
                                  item?['emi']?.toString() ?? 'No EMI';
                              String subtitle = item?['duration']?.toString() ??
                                  'No Duration';
                              bool isRecommended =
                                  item?['tag'] == 'recommended';

                              return Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 16 : 12,
                                  right: index ==
                                          (widget
                                                      .stack2?['open_state']
                                                          ?['body']?['items']
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
                                  isSelected: index == 0,
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
                              widget.onnext();
                              changestate();
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
                                  widget.stack2?['cta_text'] ?? '',
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
