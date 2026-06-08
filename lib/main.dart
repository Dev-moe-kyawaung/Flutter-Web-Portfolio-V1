import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme.dart';
import 'widgets.dart';
import 'sections.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moe Kyaw Aung | Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.cyan,
          secondary: AppColors.pink,
          tertiary: AppColors.yellow,
          surface: AppColors.panel,
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();
  final _navKey = GlobalKey();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _appsKey = GlobalKey();
  final _contactKey = GlobalKey();

  bool showTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final next = _scrollController.offset > 400;
      if (next != showTop) setState(() => showTop = next);
    });
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CyberBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                HomeNavbar(
                  navKey: _navKey,
                  onTap: _scrollTo,
                  heroKey: _heroKey,
                  aboutKey: _aboutKey,
                  skillsKey: _skillsKey,
                  servicesKey: _servicesKey,
                  projectsKey: _projectsKey,
                  appsKey: _appsKey,
                  contactKey: _contactKey,
                ),
                HeroSection(key: _heroKey),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                ServicesSection(key: _servicesKey),
                ProjectsSection(key: _projectsKey),
                AppsSection(key: _appsKey),
                ContactSection(key: _contactKey),
                const SizedBox(height: 80),
              ],
            ),
          ),
          floatingActionButton: AnimatedSlide(
            duration: const Duration(milliseconds: 250),
            offset: showTop ? Offset.zero : const Offset(0, 2),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: showTop ? 1 : 0,
              child: FloatingActionButton(
                backgroundColor: AppColors.panel,
                onPressed: () => _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOutCubic,
                ),
                child: const Icon(Icons.keyboard_arrow_up_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
