require "pier_anonymizer/version"
require 'digest'

module PierAnonymizer
  def get_hash(value)
    return nil if value.nil?

    hashed = Digest::SHA256.hexdigest value.downcase
    "#{hashed[10..16]}#{hashed[30..36]}"
  end

  def from_general_string(original)
    get_hash(original)
  end

  def from_email(email)
    return nil if email.nil?

    username, domain = email.split('@')
    "#{from_general_string(username)}@#{domain}"
  end

  def from_cpf(cpf, hasPunctuation = false)
    return nil if cpf.nil?
  
    cpfNumbers = cpf.gsub(/[\.-]/, '')
    hash = get_hash(cpfNumbers).slice(0, 11);
  
    if hasPunctuation 
      hash = "#{hash[0..2]}.#{hash[3..5]}.#{hash[6..8]}-#{hash[9..]}"
    end
  
    return hash;
  end
end
