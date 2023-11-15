module FakerData
  def fetch_data
    @user1 = User.create(name: 'Paolo', photo: 'https://photos.jpg', bio: 'This is my bio', posts_counter: 1)
    @user2 = User.create(name: 'Will', photo: 'https://photos.jpg', bio: 'This is my bio', posts_counter: 2)
    @user3 = User.create(name: 'Nicky', photo: 'https://photos.jpg', bio: 'This is my bio', posts_counter: 3)
    @user4 = User.create(name: 'Vicky', photo: 'https://photos.jpg', bio: 'This is my bio', posts_counter: 4)

    @posts = []
    (1..10).each do |i|
      @posts << Post.create(user: @user1, title: "My Post number #{i}", text: "Post user #{i}")
    end

    @post_comments = @posts.first
    @comment1 = Comment.create(text: 'Comment 1', user: @user1, post: @post_comments)
    @comment2 = Comment.create(text: 'Comment 2', user: @user1, post: @post_comments)
    Like.create(user: @user1, post: @post_comments)
    Like.create(user: @user1, post: @post_comments)

    @post_comments2 = @posts.first[1]
    @other_comment1 = Comment.create(text: 'Comment 1', user: @user2, post: @post_comments2)
    @other_comment2 = Comment.create(text: 'Comment 2', user: @user2, post: @post_comments2)
    Like.create(user: @user2, post: @post_comments2)
    Like.create(user: @user2, post: @post_comments2)
  end
end
