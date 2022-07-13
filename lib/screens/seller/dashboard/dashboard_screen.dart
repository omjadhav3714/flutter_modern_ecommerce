import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/lists.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        title: const AppBarTitle(
          title: dashboard,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(
              Icons.logout,
              color: black,
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          6,
          (index) => Card(
            elevation: 2.0,
            color: white,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  dashboardAsset,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        white.withOpacity(0.9),
                        white.withOpacity(0.6),
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
                DashboardCard(
                  label: dash[index],
                  data: ico[index],
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => dashScreen[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String label;
  final IconData data;
  final void Function() onPress;
  const DashboardCard({
    required this.label,
    required this.data,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Icon(
            data,
            size: 50,
            color: primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
