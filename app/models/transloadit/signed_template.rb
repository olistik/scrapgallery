require 'openssl'

module Transloadit

  class SignedTemplate < Template
    def initialize(data)
      super(data)
      set_expiration
    end

    def signature
      @signature ||= OpenSSL::HMAC.hexdigest(DIGEST, Auth.secret, to_json)
    end

    private

    DIGEST = OpenSSL::Digest::Digest.new('sha1')

    def set_expiration
      self[:auth][:expires] = expiration_date
    end

    def expiration_date
      (DateTime.now.utc + 5.minutes).strftime('%Y/%m/%d %H:%M:%S+00:00')
    end
  end

end
