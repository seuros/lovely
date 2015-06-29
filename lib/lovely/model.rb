module Lovely
  module Model
    def loves(loveable, options = {})
      class_attribute :_loves
      self._loves ||= Lovely::Love.new
      self._loves.add(self, loveable, options)
    end
  end
end