import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/home/view/view.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../movie_history/movie_history.dart';

void main() {
  final movieResource = MovieResource();
  final searchMovieResource = SearchMovieResource();

  final moviesRepository = MoviesRepository(resource: movieResource);
  final searchMoviesRepository = SearchMoviesRepository(
    resource: searchMovieResource,
  );

  // WidgetsFlutterBinding.ensureInitialized();

  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );

//   HydratedBlocOverrides.runZoned(
//     () => runApp(
//       MultiRepositoryProvider(
//         providers: [
//           RepositoryProvider.value(value: moviesRepository),
//           RepositoryProvider.value(value: searchMoviesRepository),
//         ],
//         child: const MyApp(),
//       ),
//     ),
//     storage: storage,
//   );
// }

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: moviesRepository),
        RepositoryProvider.value(value: searchMoviesRepository),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  //#region Initializers

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _movieHistoryBloc = MovieHistoryBloc(
    moviesRepository: MoviesRepository(
      resource: MovieResource(),
    ),
  );

  //#endregion
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _movieHistoryBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
