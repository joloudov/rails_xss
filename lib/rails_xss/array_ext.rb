class Array
  def join_with_safety(sep = $,)
    f = first
    if f.is_a?(ActiveSupport::SafeBuffer) && f.html_safe?
      map { |i| ERB::Util.h(i) }.join_without_safety(ERB::Util.h(sep)).html_safe
    else
      join_without_safety(sep)
    end
  end
  alias_method_chain :join, :safety
end
