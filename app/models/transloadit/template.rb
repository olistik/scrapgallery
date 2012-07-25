require 'json'

module Transloadit

  class Template
    attr_reader :data

    def initialize(data)
      @data = data
      set_auth
    end

    def signed
      SignedTemplate.new(self)
    end

    def to_json
      @data.to_json
    end

    protected

    def set_auth
      @data[:auth] = {
        key: ::Transloadit::Auth.key
      }
    end

    def [](key)
      @data[key]
    end

    def []=(key, value)
      @data[key] = value
    end
  end

end
