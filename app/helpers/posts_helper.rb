module PostsHelper
  def commenter
    raw(
    self.each do |f|
       content_tag :li , class => "commenter"
       f.commenter
     end
     )
  end
  def post_pop(post)
    title = post.title
    length = post.comments.length}
    text = post.text
  end
end
