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

  def test_license_plate_anonymized
    license_plate = 'abc1234';
    assert_equal from_license_plate(license_plate).length, 7

    license_plate_hifen = 'abc-1234';
    assert_equal from_license_plate(license_plate_hifen, true).length, 8

    assert_equal from_license_plate(license_plate), 'f4e1e20'
    assert_equal from_license_plate(license_plate), from_license_plate(license_plate_hifen)

  end

end
