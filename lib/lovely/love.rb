module Lovely
  class Love

    def add(model, loveable, options = {})
      cn = class_name(model, loveable)
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
  end
end