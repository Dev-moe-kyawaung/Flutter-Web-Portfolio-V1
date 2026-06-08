import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/services_section.dart';
import 'sections/projects_section.dart';
import 'sections/apps_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';
import 'widgets/cyber_background.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moe Kyaw Aung Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.bg,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          primary: AppTheme.cyan,
          secondary: AppTheme.pink,
          tertiary: AppTheme.yellow,
          surface: AppTheme.panel,
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
  final scrollController = ScrollController();

  final navKey = GlobalKey();
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final appsKey = GlobalKey();
  final contactKey = GlobalKey();
  final footerKey = GlobalKey();

  bool showTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final next = scrollController.offset > 400;
      if (next != showTop) setState(() => showTop = next);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 850),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
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
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                NavbarSection(
                  navKey: navKey,
                  heroKey: heroKey,
                  aboutKey: aboutKey,
                  skillsKey: skillsKey,
                  servicesKey: servicesKey,
                  projectsKey: projectsKey,
                  appsKey: appsKey,
                  contactKey: contactKey,
                  onNavigate: scrollTo,
                ),
                HeroSection(key: heroKey),
                AboutSection(key: aboutKey),
                SkillsSection(key: skillsKey),
                ServicesSection(key: servicesKey),
                ProjectsSection(key: projectsKey),
                AppsSection(key: appsKey),
                ContactSection(key: contactKey),
                FooterSection(key: footerKey),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          right: 18,
          bottom: showTop ? 18 : -80,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: showTop ? 1 : 0,
            child: FloatingActionButton(
              backgroundColor: AppTheme.panel,
              onPressed: () => scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOutCubic,
              ),
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
