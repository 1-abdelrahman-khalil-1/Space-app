import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/Services/get_it.dart';
import 'package:space_app/Core/utils/approuter.dart';
import 'package:space_app/Features/News%20Screen/presentation/cubit/news_cubit.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20cubit/planet_cubit.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20video%20cubit/planet_video_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlanetCubit>(
          create: (context) => get_it<PlanetCubit>(),
        ),
        BlocProvider<PlanetVideoCubit>(
          create: (context) => get_it<PlanetVideoCubit>(),
        ),
        BlocProvider<NewsCubit>(
          create: (context) => get_it<NewsCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        child: MaterialApp.router(
            routerConfig: Approuter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white),
                
              ),
            )),
      ),
    );
  }
}
