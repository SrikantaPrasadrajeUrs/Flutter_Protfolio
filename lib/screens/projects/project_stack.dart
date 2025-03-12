import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../storage/helpers.dart';

class ProjectCard extends StatefulWidget {
  final int index;
  final String name;
  final String description;
  final String technology;
  final String? frontendLink;
  final String? backendLink;
  final String? imageLink;
  final String? videoLink;

  const ProjectCard({
   required this.index,
    super.key,
    required this.name,
    required this.description,
    required this.technology,
    this.frontendLink,
    this.backendLink,
    this.imageLink,
    this.videoLink,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  List<Color> colors = [];

  @override
  void initState() {
    super.initState();
     colors = widget.index%2==0? [Colors.blueAccent, Colors.pinkAccent]:[Colors.pinkAccent, Colors.blueAccent];
    if (widget.videoLink != null) {
      _videoController = VideoPlayerController.asset(widget.videoLink!);
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: false,
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      await Future.delayed(Duration(seconds: widget.index+1));
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
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: isMobile ? 10 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display image if available
              if (widget.imageLink != null&&widget.videoLink==null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.imageLink!,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
      
              // Display video player if available
              if (widget.videoLink != null) ...[
                const SizedBox(height: 10),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: _chewieController!),
                ),
              ],
      
              const SizedBox(height: 10),
      
              // Project Name
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
      
              // Description
              Text(
                widget.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10),
      
              // Technologies Used
              Text(
                "Tech: ${widget.technology}",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
      
              // Links Row
              Row(
                children: [
                  if (widget.frontendLink != null)
                    _buildLinkButton("Frontend", widget.frontendLink!),
                  if (widget.backendLink != null)
                    _buildLinkButton("Backend", widget.backendLink!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create a clickable button for GitHub links
  Widget _buildLinkButton(String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton.icon(
        onPressed: () => launchURL(url),
        icon: const Icon(Icons.code, size: 18),
        label: Text(title),
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
