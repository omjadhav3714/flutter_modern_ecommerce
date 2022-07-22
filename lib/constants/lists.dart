import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/models/item_data_model.dart';
import 'package:modern_ecommerce/screens/category_screen.dart';
import 'package:modern_ecommerce/screens/home/home_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/balance_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/dashboard_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/edit_profile_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/manage_products_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/my_store_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/orders_screen.dart';
import 'package:modern_ecommerce/screens/seller/dashboard/statistics_screen.dart';
import 'package:modern_ecommerce/screens/seller/upload_product_screen.dart';
import 'package:modern_ecommerce/screens/store/stores_screen.dart';
import 'package:modern_ecommerce/screens/users/cart_screen.dart';
import 'package:modern_ecommerce/screens/users/profile_screen.dart';
import 'package:modern_ecommerce/screens/store/visit_store_screen.dart';
import 'package:modern_ecommerce/utils/category_list.dart';
import 'package:modern_ecommerce/widgets/category/category_widget.dart';
import 'package:modern_ecommerce/widgets/custom_tab_widget.dart';

// Dashboard List
List<String> dash = [
  myStore,
  dashOrders,
  editProfile,
  managePro,
  balance,
  statistics,
];

// Dashboard Icons
List<IconData> ico = [
  Icons.store,
  Icons.shopping_bag,
  Icons.edit,
  Icons.settings,
  Icons.money,
  Icons.auto_graph
];

// Dashboard Screens
List<Widget> dashScreen = [
  MyStoreScreen(documentId: FirebaseAuth.instance.currentUser!.uid),
  OrdersScreen(),
  EditProfileScreen(),
  ManageProductsScreen(),
  BalanceScreen(),
  StatisticsScreen()
];

// Category Sidebar
List<ItemData> items = [
  ItemData(label: men),
  ItemData(label: women),
  ItemData(label: kids),
  ItemData(label: mobile),
  ItemData(label: gaming),
  ItemData(label: pc),
  ItemData(label: shoes),
  ItemData(label: bags),
  ItemData(label: electronics),
  ItemData(label: accessories),
];

// Sub Category widgets
List<CategoryWidget> catWidgetList = const [
  CategoryWidget(
    catName: men,
    assestName: menAsset,
    subCat: menL,
  ),
  CategoryWidget(
    subCat: womenL,
    catName: women,
    assestName: womenAsset,
  ),
  CategoryWidget(
    subCat: kidsL,
    catName: kids,
    assestName: kidsAsset,
  ),
  CategoryWidget(
    subCat: mobileL,
    catName: mobile,
    assestName: mobileAsset,
  ),
  CategoryWidget(
    subCat: gamingL,
    catName: gaming,
    assestName: gamingAsset,
  ),
  CategoryWidget(
    subCat: pcL,
    catName: pc,
    assestName: pcAsset,
  ),
  CategoryWidget(
    subCat: shoesL,
    catName: shoes,
    assestName: shoesAsset,
  ),
  CategoryWidget(
    subCat: bagsL,
    catName: bags,
    assestName: bagsAsset,
  ),
  CategoryWidget(
    subCat: electronicsL,
    catName: electronics,
    assestName: electronicsAsset,
  ),
  CategoryWidget(
    subCat: accessoriesL,
    catName: accessories,
    assestName: accessoriesAsset,
  ),
];

// Bottombar widgets
List<Widget> tabs = [
  const HomeScreen(),
  const CategoryScreen(),
  const StoreScreen(),
  const CartScreen(),
  ProfileScreen(),
];

// Bottombar bar items
List<BottomNavigationBarItem> bottom = const [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
    ),
    label: home,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.search,
    ),
    label: category,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.shop,
    ),
    label: store,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.shopping_cart,
    ),
    label: cart,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.person,
    ),
    label: profile,
  ),
];

// Seller Tabs for bottom bar
List<Widget> sellerTabs = const [
  HomeScreen(),
  CategoryScreen(),
  StoreScreen(),
  DashBoardScreen(),
  UploadProductScreen(),
];

List<BottomNavigationBarItem> sellerBottom = const [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
    ),
    label: home,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.search,
    ),
    label: category,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.shop,
    ),
    label: store,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.dashboard,
    ),
    label: dashboard,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.upload,
    ),
    label: addProduct,
  ),
];

List<CustomTabWidget> customTabs = const [
  CustomTabWidget(
    label: men,
  ),
  CustomTabWidget(
    label: women,
  ),
  CustomTabWidget(
    label: kids,
  ),
  CustomTabWidget(
    label: shoes,
  ),
  CustomTabWidget(
    label: bags,
  ),
  CustomTabWidget(
    label: mobile,
  ),
  CustomTabWidget(
    label: gaming,
  ),
  CustomTabWidget(
    label: electronics,
  ),
  CustomTabWidget(
    label: pc,
  ),
  CustomTabWidget(
    label: accessories,
  ),
];
