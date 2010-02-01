module UrlNormalization
  def normalize_url(field_name)
    define_method "#{field_name}=" do |val|
      val.strip! if val.respond_to?(:strip!)
      val = "http://#{val}" if !val.blank? && !(val =~ /^http/)
      super(val)
    end
  end
end
