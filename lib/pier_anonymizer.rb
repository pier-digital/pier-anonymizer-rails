require "pier_anonymizer/version"
require 'digest'

module PierAnonymizer
  def get_hash(value)
  
    # To difficult the discovering of the original value,
    # as also getting a pretty smaller string instead of the generated sha256 value
    # (e.g. because of database column size constraints),
    # we generate the anonymized value from two different substrings of the generated hash.

    # ===== Why do not apply Salt or Pepper?
    #  Just to make it simple.
    #  There is no need to create another rule or structure for salts and pepper.
    #  And, in the end, we're gonna need to get just a substring of the hash.
    # =====

    # ===== Then notice:
    #  The intervals 10..17 and 30..37 are just magic numbers.
    #  However, it must be obeyed anywhere in order to always generate the same value.

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
