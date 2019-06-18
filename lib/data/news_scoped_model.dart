import 'package:hacknewsapp/config/config.dart';
import 'package:hacknewsapp/models/News.dart';
import 'package:hacknewsapp/services/api.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsModel extends Model {
  List<News> _newsList = [];
  List<News> get newsList => _newsList;
  List<dynamic> ids = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setNews(i) async {
    _newsList.add(News.fromJson(
        await Api.getRequest(config["BASE_URL"] + "item/${ids[i]}.json")));
    print(_newsList);
  }

  setIsLoading(bool status) {
    _isLoading = status;
  }

  getId() async {
    ids = await Api.getRequest(config["BASE_URL"] + "topstories.json");
    print(ids);
    for (int i = 0; i < 10; i++) {
      await setNews(i);
    }

    setIsLoading(true);
    notifyListeners();
  }
}
