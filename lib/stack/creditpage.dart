import 'package:cred_assignment/utils/colors.dart';
import 'package:cred_assignment/stack/stack1.dart';
import 'package:cred_assignment/stack/stack2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CreditPage extends StatefulWidget {
  final List<dynamic> stackData;

  const CreditPage({super.key, required this.stackData});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> with TickerProviderStateMixin {
  Map<String, dynamic>? stack1;
  Map<String, dynamic>? stack2;
  Map<String, dynamic>? stack3;
  bool first = false;

  late AnimationController controller;
  late Animation sizeAnimation;
  late AnimationController controller1;
  late Animation sizeAnimation1;

  void exitpage1(AnimationController ac) {
    ac.reverse();
    print("This is on exit");
  }

  void onnextpage(AnimationController ac) {
    ac.forward();
  }

  void separateStackData(List<dynamic> stackData) {
    if (stackData.length >= 3) {
      stack1 = stackData[0] as Map<String, dynamic>;
      stack2 = stackData[1] as Map<String, dynamic>;
      stack3 = stackData[2] as Map<String, dynamic>;
    } else {
      print("Error: stackData does not contain enough elements.");
    }
  }

  @override
  void initState() {
    super.initState();
    final mq = MediaQueryData.fromView(WidgetsBinding.instance.window);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    sizeAnimation = Tween(begin: -mq.size.height, end: 0.0).animate(controller);

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    sizeAnimation1 =
        Tween(begin: -mq.size.height, end: 0.0).animate(controller1);

    separateStackData(widget.stackData);

    print("Stack 1: $stack1");
    print("Stack 2: $stack2");
    print("Stack 3: $stack3");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: const Color(0xFF0E1419),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close,
                                color: Colors.white, size: 20),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.help_outline,
                                color: Colors.white, size: 20),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Help",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  content: Text(
                                    "Information about this page.",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Close",
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stack1?['open_state']['body']['title'] ??
                                'No Title',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            stack1?['open_state']['body']['subtitle'] ??
                                'No Title',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: SizedBox(
                        height: 350,
                        width: 380,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 12.0,
                                percent: 0.7,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      stack1?['open_state']?['body']?['card']
                                              ?['header'] ??
                                          'No Title',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "₹150000",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      stack1?['open_state']?['body']?['card']
                                              ?['description'] ??
                                          '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                progressColor: Colors.orange,
                                backgroundColor: Colors.orange.withOpacity(0.3),
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                stack1?['open_state']?['body']?['footer'] ?? '',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  controller.forward();
                  setState(() {
                    first = !first;
                  });
                },
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      stack1?['cta_text'] ?? '',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Positioned(
                  bottom: double.tryParse(sizeAnimation.value.toString()),
                  child: SimplePage(
                    onexit1: () => exitpage1(controller),
                    onnext: () => onnextpage(controller1),
                    stack2: stack2,
                  ),
                );
              },
              animation: controller,
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Positioned(
                    bottom: double.tryParse(sizeAnimation1.value.toString()),
                    child: SimplePage2(
                      onexit1: () => exitpage1(controller1),
                      onnext: () {},
                      stack3: stack3,
                    ));
              },
              animation: controller1,
            ),
          ],
        ),
      ),
    );
  }
}