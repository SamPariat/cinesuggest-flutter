abstract class SentimentAbstract {
  Future<dynamic> getReviews(String id);

  Future<dynamic> saveReview(String id, String review, String accessToken);
}
