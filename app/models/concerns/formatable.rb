module Formatable
  extend ActiveSupport::Concern

  module ClassMethods
    def formatable_fields(*keys)
      keys.each do |m|
        define_method(m) { Format.new(self, m).format }
      end
    end
  end

  class Format
    attr_reader :model, :key

    MATCHER = { domain: 'записки-хозяйки.рф',
                site:   'Записки хозяйки' }

    def initialize(model, key)
      @model, @key = model, key
    end

    def format
      @model[@key].gsub(/{[^{}]+}/) do |p|
        msg = p.delete('{}').to_sym
        MATCHER[msg] || (@model.respond_to?(msg) ? @model.send(msg) : '')
      end
    end
  end
end
