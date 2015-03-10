module CommentsHelper
  def comments_tree_for(tree:, order: :votes)  # recursively render comments.
    tree.sort { |(a_k, a_v), (b_k, b_v)| b_k.send(order) <=> a_k.send(order) }.map do |parent, children|
      render(parent) +
      (children.empty? ? "" : content_tag(:div, comments_tree_for(tree: children, order: order), class: "replies"))
    end.join.html_safe
  end
end


