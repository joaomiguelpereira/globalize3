require 'active_record'

ActiveRecord::QueryMethods.class_eval do
  def where_with_translations(opts, *rest)
    if klass.respond_to?(:translated_attribute_names)
      translated_attribute_names = klass.translated_attribute_names
      if opts.is_a?(Hash) && (keys = opts.symbolize_keys.keys & translated_attribute_names).present?
        keys.each { |key| opts[klass.translations_table_name + '.' + key.to_s] = opts.delete(key) }
        return klass.with_translations.where_without_translations(opts, *rest)
      end
    end
    where_without_translations(opts, *rest)
  end

  alias_method_chain :where, :translations
end
