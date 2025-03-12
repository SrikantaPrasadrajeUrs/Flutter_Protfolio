import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../storage/helpers.dart';

class ExperienceCard extends StatefulWidget {
  final int index;
  final String companyName;
  final String role;
  final String start;
  final String end;
  final List<String> projects;
  final String skills;
  final String googlePlayStore;
  final String appStore;
  final List<String> responsibilities;

  const ExperienceCard({
    super.key,
    required this.index,
    required this.companyName,
    required this.role,
    required this.start,
    required this.end,
    required this.projects,
    required this.skills,
    required this.googlePlayStore,
    required this.appStore,
    required this.responsibilities,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  late List<Color> colors;

  @override
  void initState() {
    super.initState();
    colors = widget.index%2==0?  [Colors.green, Colors.blue]: [Colors.blue, Colors.green];
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: widget.index + 1));
      _startColorToggle();
    });
  }

  void _startColorToggle() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 1500));
      if (mounted) {
        setState(() {
          colors = colors.reversed.toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: colors),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.work, color: Colors.orange, size: 28),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.companyName,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.role,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${widget.start} - ${widget.end}",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Projects: ${widget.projects.join(', ')}",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Skills: ${widget.skills}",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.responsibilities.map((resp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check, color: Colors.green, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            resp,
                            style: GoogleFonts.roboto(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildLinkButton("Play Store", widget.googlePlayStore),
                  _buildLinkButton("App Store", widget.appStore),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLinkButton(String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: ElevatedButton.icon(
        onPressed: () => launchURL(url),
        icon: const Icon(Icons.open_in_new, size: 12),
        label: Text(title,style: const TextStyle(fontSize: 12),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
