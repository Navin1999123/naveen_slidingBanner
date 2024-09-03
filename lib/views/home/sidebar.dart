import 'package:flutter/material.dart';
import 'package:sliding_banners/custom_widgets/sidebar_tab.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
         
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,size: 50,),
                ),
                SizedBox(height: 10),
                Text(
                  'Hi, User!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SidebarTab(
            title: 'Profile',
            onTap: () {
              Navigator.pop(context);
           
            },
          ),
          SidebarTab(
            title: 'About Us',
            onTap: () {
              Navigator.pop(context);
            
            },
          ),
          SidebarTab(
            title: 'Share',
            onTap: () {
              Navigator.pop(context);
             
            },
          ),
          SidebarTab(
            title: 'Privacy Policy',
            onTap: () {
              Navigator.pop(context);
           
            },
          ),
          SidebarTab(
            title: 'Terms and Conditions',
            onTap: () {
              Navigator.pop(context);
          
            },
          ),
          SidebarTab(
            title: 'Contact Us',
            onTap: () {
              Navigator.pop(context);
         
            },
          ),
          SidebarTab(
            title: 'Settings',
            onTap: () {
              Navigator.pop(context);
              
            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '© 2024 Your Company. All Rights Reserved.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

