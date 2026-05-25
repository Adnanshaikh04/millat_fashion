import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final int currentIndex;

  const Navbar({super.key, this.currentIndex = 0});

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _NavbarState extends State<Navbar> {
  int _hoveredIndex = -1;

  final List<Map<String, dynamic>> _navItems = [
    {'title': 'Home', 'route': '/'},
    {'title': 'Products', 'route': '/products'},
    {'title': 'About', 'route': '/about'},
    {'title': 'Contact', 'route': '/contact'},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.getHorizontalPadding(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            _buildLogo(),

            // Navigation Items
            if (!isMobile)
              Row(
                children: List.generate(_navItems.length, (index) {
                  return _buildNavItem(index);
                }),
              ),

            // WhatsApp Button or Menu Icon
            if (isMobile)
              IconButton(
                icon: const Icon(Icons.menu, color: AppTheme.textDark),
                onPressed: () => _showMobileMenu(context),
              )
            else
              _buildWhatsAppButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/'),
      child: Row(
        children: [
          // Colorful M logo representation
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppTheme.primaryRed,
                  AppTheme.primaryOrange,
                  AppTheme.primaryYellow,
                  AppTheme.primaryGreen,
                  AppTheme.primaryBlue,
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'MF',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    AppTheme.primaryRed,
                    AppTheme.primaryOrange,
                    AppTheme.primaryGreen,
                    AppTheme.primaryBlue,
                  ],
                ).createShader(bounds),
                child: const Text(
                  'Millat',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'Fashion Kids Wear',
                style: TextStyle(
                  fontSize: 10,
                  color: AppTheme.primaryRed,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isActive = widget.currentIndex == index;
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, _navItems[index]['route']),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isActive
                ? AppTheme.primaryBlue.withOpacity(0.1)
                : isHovered
                ? AppTheme.primaryBlue.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            _navItems[index]['title'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive
                  ? AppTheme.primaryBlue
                  : isHovered
                  ? AppTheme.primaryBlue
                  : AppTheme.textDark,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhatsAppButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF25D366), Color(0xFF128C7E)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF25D366).withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            // Launch WhatsApp
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.chat, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'WhatsApp',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(_navItems.length, (index) {
              return ListTile(
                leading: Icon(
                  index == 0
                      ? Icons.home_rounded
                      : index == 1
                      ? Icons.shopping_bag_rounded
                      : index == 2
                      ? Icons.info_rounded
                      : Icons.contact_mail_rounded,
                  color: widget.currentIndex == index
                      ? AppTheme.primaryBlue
                      : AppTheme.textGrey,
                ),
                title: Text(
                  _navItems[index]['title'],
                  style: TextStyle(
                    fontWeight: widget.currentIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: widget.currentIndex == index
                        ? AppTheme.primaryBlue
                        : AppTheme.textDark,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, _navItems[index]['route']);
                },
              );
            }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.chat, color: Color(0xFF25D366)),
              title: const Text('Chat on WhatsApp'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
