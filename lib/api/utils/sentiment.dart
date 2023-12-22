import './sentiment_abstract.dart';

class Sentiment implements SentimentAbstract {
  @override
  Future getReviews(String id) {
    throw UnimplementedError();
  }

  @override
  Future saveReview(String id, String review, String accessToken) {
    throw UnimplementedError();
  }
}
