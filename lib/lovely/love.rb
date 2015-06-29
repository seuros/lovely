module Lovely
  class Love

    def add(model, loveable, options = {})
      cn = class_name(model, loveable)
      ms = model_singular(model)
      ls = loveable_singular(loveable)
      cc = cache_counter(model, loveable)
      join_class = Class.new(ActiveRecord::Base) do
        belongs_to :"#{ms}", required: true
        belongs_to :"#{ls}", counter_cache: :"#{cc}", required: true
      end
      Object.const_set(cn,join_class)

      model.class_eval do
        has_many :"#{loveable}_likes", class_name: cn, dependent: :destroy
        has_many :"liked_#{loveable}", through: :"#{loveable}_likes", source: :"#{loveable.to_s.singularize}"
      end
    end

    private
      def class_name(model, loveable)
        model_class = model.name
        loveable_class = loveable.to_s.classify
        "#{model_class}#{loveable_class}Like"
      end

      def cache_counter(model, loveable)
        "#{class_name(model, loveable).pluralize.underscore}_count"
      end

      def model_singular(model)
        model.name.underscore
      end

      def loveable_singular(loveable)
        loveable.to_s.singularize
      end
  end
end