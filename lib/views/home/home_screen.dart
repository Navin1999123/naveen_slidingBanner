import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_banners/blocs/home_dashboard_bloc/bloc.dart';
import 'package:sliding_banners/blocs/home_dashboard_bloc/state.dart';
import 'package:sliding_banners/custom_widgets/comman_carousel.dart';
import 'package:sliding_banners/simmers/simmer.dart';
import 'package:sliding_banners/views/home/summary_screen.dart';
import 'package:sliding_banners/views/home/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JsonDataCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title:const  Text('Dashboard'),
      ),
      body: BlocBuilder<JsonDataCubit, JsonDataState>(
        builder: (context, state) {
          if (state is JsonDataLoadingState) {
            return const LoadingSimmers(); } 
            else if (state is JsonDataLoadedState) {
            final data = state.dataModal;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                const Text(
                  'Banners',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                CustomCarousel(
                  items: data.dashboard.banners
                      .map((banner) => CarouselItem(
                          title: banner.title,
                          coverImage: banner.coverImage,
                          summary: banner.summary))
                      .toList(),
                  height: 200,
                  onTap: (item) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryPage(
                          title: item.title,
                          summary: item.summary,
                          coverImage: item.coverImage,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: data.dashboard.categories.length,
                  itemBuilder: (context, index) {
                    final category = data.dashboard.categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: category.image.isNotEmpty
                              ? AssetImage(category.image)
                              : const AssetImage('assets/images/no_image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                          stops: const [0.5, 1.0],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    category.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Count: ${category.count}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trending News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                CustomCarousel(
                  items: data.dashboard.trendingNews
                      .map((tnews) => CarouselItem(
                          title: tnews.title,
                          coverImage: tnews.coverImage,
                          summary: tnews.summary))
                      .toList(),
                  height: 200,
                  onTap: (item) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryPage(
                          title: item.title,
                          summary: item.summary,
                          coverImage: item.coverImage,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Breaking News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                CustomCarousel(
                  items: data.dashboard.breakingNews
                      .map((bnews) => CarouselItem(
                          title: bnews.title,
                          coverImage: bnews.coverImage,
                          summary: bnews.summary))
                      .toList(),
                  height: 200,
                  onTap: (item) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryPage(
                          title: item.title,
                          summary: item.summary,
                          coverImage: item.coverImage,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is JsonDataErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
