class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Posts {
  List<Post> posts;
  Posts({required this.posts});

  factory Posts.fromJson(List<dynamic> jsonList) {
    final List<Post> postsList =
    jsonList.map((post) => Post.fromJson(post)).toList();
    return Posts(posts: postsList);
  }
}