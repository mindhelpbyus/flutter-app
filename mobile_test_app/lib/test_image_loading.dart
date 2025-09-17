import 'package:flutter/material.dart';

class TestImageLoading extends StatelessWidget {
  const TestImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Loading Test')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Testing Network Images:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            // Test Image 1
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDOtMvIpbAcU_sCI9NzSZFbQidSwae9_yCeXj4MruJUu7V7I4T2thx-XaVcGA4ncwqSGOjM9i9DV-hZI0ySxjUO7ZlYd64FBOBEuvkrO0WCFHGjj2Gt9da23oFHXjWyHAPoqcu6rw8C8hkCmZM9x5FD5Ec3ECR4FYBVbYxGRYiO0exFE1wdr8xaZSBixJ36NLCRflvcFs2XFlO4eI-vpOgvZ7vz7olWeQUkYN5SgD7D_gB4XU5AaDtax7uxS2OeWOPc9ZnhcteG_bc',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  print('Image loading error: $error');
                  return Container(
                    color: Colors.red[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 50),
                        const SizedBox(height: 8),
                        Text('Failed to load image\nError: $error', 
                             textAlign: TextAlign.center,
                             style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            const Text('Dr. Anya Sharma', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 30),
            
            // Test Image 2
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAwZM4YIKo65Rl8G0EF8kUbruVag2R40QmimWluJNsrhvD0mgeeGMBx1cwHFHELoZdSDIQIcxx08lHi6ddJnz6Gsyh00pe-RkW6me9giNfGWYPoFrAq69nmD6R0cAWuNq_khGlaw9yG5NZzbdgWyvUMfOJXCLtM7iQ9bQ6ZXiqvAEVmgaU2WpDASmPdd9_NKFZh-3vBU4aNnfyoauv9G3VOU7sCOr3o1FxNfOe4dLw1-YCwYb5aAsCQjnufnQ-HH0RgEoovSe801Pk',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  print('Image loading error: $error');
                  return Container(
                    color: Colors.red[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 50),
                        const SizedBox(height: 8),
                        Text('Failed to load image\nError: $error', 
                             textAlign: TextAlign.center,
                             style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            const Text('Dr. Varun Verma', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 30),
            
            // Test simple image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                'https://picsum.photos/300/200',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  print('Simple image loading error: $error');
                  return Container(
                    color: Colors.orange[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.orange, size: 50),
                        const SizedBox(height: 8),
                        Text('Failed to load simple image\nError: $error', 
                             textAlign: TextAlign.center,
                             style: const TextStyle(color: Colors.orange)),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            const Text('Test Image (picsum.photos)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
