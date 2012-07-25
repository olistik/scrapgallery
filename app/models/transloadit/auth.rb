module Transloadit

  module Auth
    extend self

    def key
      ENV['TRANSLOADIT_AUTH_KEY']
    end

    def secret
      ENV['TRANSLOADIT_AUTH_SECRET']
    end
  end

end
