import 'package:eikos/widgets/cards/invoices_cards.dart';
import 'package:eikos/widgets/cards/new_cards.dart';
import 'package:eikos/widgets/cards/top_cards.dart';
import 'package:eikos/widgets/emails/recent_emails.dart';
import 'package:eikos/widgets/charts/revenue_chart.dart';
import 'package:eikos/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:eikos/widgets/sidebar/sidebar.dart';
import 'package:eikos/widgets/sidebarRight/sidebar_right.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          // Sidebar
          Sidebar(),

          // Main Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Header(),

                  SizedBox(height: 20),

                  // Main content with scroll
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: [
                              // Top Cards Row
                              TopCards(),

                              SizedBox(height: 20),

                              // Middle Row (Stats & Chart)
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left stats
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          NewClientsCard(),
                                          SizedBox(height: 20),
                                          InvoicesOverdueCard(),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 20),

                                    // Revenue chart
                                    Expanded(flex: 7, child: RevenueChart()),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),

                              // Recent Emails
                              SizedBox(height: 300, child: RecentEmails()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right sidebar
          RightSidebar(),
        ],
      ),
    );
  }
}
