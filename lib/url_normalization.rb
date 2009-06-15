module UrlNormalization
  def normalize_url(field_name)
    define_method "#{field_name}=" do |val|
      val = "http://#{val}" unless val =~ /^http/
      write_attribute(field_name, val)
    end
  end
end
