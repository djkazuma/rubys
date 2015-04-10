class String
  def to_image_tag(src_from = nil, src_to = nil)
    h = Hash.new
    self.gsub(/<img(.*?)\/>/) do |text|
      text.split(' ').each do |t|
        if t.include?('=')
          s = t.split('=')
          h[s[0]] = s[1]
        end
      end
      src = h['src']
      result = nil
      unless src.nil?
        h.delete('src')
        unless src_from.nil? && src_to.nil?
          src = src.gsub(Regexp.new(src_from), src_to)
        end
        result = "<%= image_tag #{src}"
        h.each do |k, v|
          result += ', ' + "#{k}: #{v}"
        end
        result += ' %>'
      end
      result.nil? ? text : result
    end
  end
end
