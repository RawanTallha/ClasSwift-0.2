import 'package:classwift/pages/services_page.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final iconImagePath;
  final String serviceName;
final pageName;
  final String pageTitle;
  final String buttonText;

// constructor to change icon and service in every card
  ServicesCard({
    required this.iconImagePath,
    required this.serviceName,
    required this.pageName,
    required this.pageTitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20), // space between each card

      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Row(
            children: [
              Image.asset(
                iconImagePath,
                height: 40,
              ),
              SizedBox(width: 10),
              Text(
                serviceName,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return pageName;
                  }));
                },
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
