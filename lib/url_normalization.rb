module UrlNormalization
  def normalize_url(field_name)
    define_method "#{field_name}=" do |val|
      val = "http://#{val}" if !val.blank? && !(val =~ /^http/)
      super(val)
    end
  end
end
