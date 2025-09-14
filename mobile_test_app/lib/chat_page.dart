import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';

class ChatPage extends StatefulWidget {
  final String doctorName;
  final String doctorImageUrl;
  final String patientName;
  final String patientImageUrl;
  
  const ChatPage({
    super.key,
    required this.doctorName,
    required this.doctorImageUrl,
    this.patientName = 'Liam',
    this.patientImageUrl = 'https://lh3.googleusercontent.com/aida-public/AB6AXuCHcACDotwCorJ5OYl0aY8BjSxp24SFnqfWfsYgsJbhOSlV5gdIbYF55Sqm8A96cOsh1b1oy5Vn35WX-ZsPjLI6BLG1nOgllAEeYpYRqAJOUlrVzzqbSudbWDWtLQiCV77kE4qY5RwdVCAuOoGH0S3RFN6fON3xb5e-J_S8EIEaaH08ap1xIZCluGso3XI2rEKLZR1i3r5cxX5pb3r8QY5NQuqj_XTZGO-kzHMkQr1k0M66DtM7SRZM50pxqOEKDEhVHqTzwslrPJU',
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    _initializeMessages();
  }

  void _initializeMessages() {
    messages = [
      ChatMessage(
        text: 'Hi, Liam. How are you feeling today?',
        isFromDoctor: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      ChatMessage(
        text: 'I\'m feeling a bit anxious about my upcoming presentation at work. Any tips?',
        isFromDoctor: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
      ),
      ChatMessage(
        text: 'Deep breathing exercises can help. Inhale for 4 seconds, hold for 4, and exhale for 6. Try it now.',
        isFromDoctor: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        text: 'Okay, I\'ll try that. Thanks!',
        isFromDoctor: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ];
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    
    setState(() {
      messages.add(ChatMessage(
        text: _messageController.text.trim(),
        isFromDoctor: false,
        timestamp: DateTime.now(),
      ));
    });
    
    _messageController.clear();
    
    // Auto scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Chat Messages
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            
            // Message Input
            _buildMessageInput(),
            
            // Bottom spacing
            Container(
              height: 20,
              color: AppColors.background,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.textPrimary,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.doctorName,
              textAlign: TextAlign.center,
              style: GoogleFonts.splineSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                letterSpacing: -0.015,
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                // Handle phone call action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Calling feature not implemented yet'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.materialTransparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.phone,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: message.isFromDoctor 
            ? MainAxisAlignment.start 
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.isFromDoctor) ...[
            // Doctor avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.doctorImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          
          // Message content
          Flexible(
            child: Column(
              crossAxisAlignment: message.isFromDoctor 
                  ? CrossAxisAlignment.start 
                  : CrossAxisAlignment.end,
              children: [
                // Sender name
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    message.isFromDoctor ? widget.doctorName : widget.patientName,
                    style: GoogleFonts.splineSans(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                
                // Message bubble
                Container(
                  constraints: const BoxConstraints(maxWidth: 360),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: message.isFromDoctor 
                        ? AppColors.backgroundSecondary 
                        : AppColors.accent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message.text,
                    style: GoogleFonts.splineSans(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: message.isFromDoctor 
                          ? AppColors.textPrimary 
                          : AppColors.textOnAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          if (!message.isFromDoctor) ...[
            const SizedBox(width: 12),
            // Patient avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.patientImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Write a message',
                        hintStyle: GoogleFonts.splineSans(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.inputHint,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      style: GoogleFonts.splineSans(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.inputText,
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  
                  // Image attachment button
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Handle image attachment
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Image attachment feature not implemented yet'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_outlined,
                          color: AppColors.iconSecondary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  
                  // Send button
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        height: 32,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Send',
                          style: GoogleFonts.splineSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textOnAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isFromDoctor;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isFromDoctor,
    required this.timestamp,
  });
}
