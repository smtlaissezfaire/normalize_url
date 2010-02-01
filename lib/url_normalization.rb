module UrlNormalization
  def normalize_url(field_name)
    define_method "#{field_name}=" do |val|
      unless val.blank?
        val.strip!
        val = "http://#{val}" if !val.blank? && !(val =~ /^http/)
        val.downcase!
      end

      super(val)
    end
  end
end
