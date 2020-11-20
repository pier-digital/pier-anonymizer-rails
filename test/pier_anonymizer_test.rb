$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'test_helper'
require 'pier_anonymizer'

class PierAnonymizerTest < Minitest::Test
  include PierAnonymizer

  def test_string_anonymized
    value = 'test'
    assert_equal from_general_string(value), '4c7d65915a3bf4'
  end

  def test_cpf_anonymized
    cpf = '12345678901'
    hashed_cpf = from_cpf(cpf)
    assert_equal hashed_cpf.length, 11

    cpf = '123.456.789-01'
    hashed_cpf_with_punctuation = from_cpf(cpf)
    assert_equal hashed_cpf, hashed_cpf_with_punctuation

    assert_equal hashed_cpf, 'b47dd65c26d'

    hashed_cpf = from_cpf(cpf, true)
    assert_equal hashed_cpf.length, 14
  
  end

  def test_email_anonymized
    assert_equal from_email('test@gmail.com'), '4c7d65915a3bf4@gmail.com'
  end

end
