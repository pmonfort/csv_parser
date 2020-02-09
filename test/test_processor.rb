require 'minitest/autorun'
require 'minitest/spec'
require 'processor'

describe Processor do
  let(:processor) { Processor.new }
  let(:valid_file) { './test/fixtures/valid.csv' }
  let(:invalid_file) { './test/fixtures/invalid.csv' }

  describe 'processes valid files' do
    it 'returns success aaa' do
      result = processor.process(valid_file)

      assert result[:success]
    end

    it 'returns the right max sign up date' do
      result = processor.process(valid_file)

      expected_result = {
        'Name' => 'Jacob',
        'Email' => 'jacab@testmail.com',
        'Sign Up Date' => '2020-02-08',
        'Role' => 'admin'
      }
      assert_equal expected_result, result[:max_date_record]
    end

    it 'returns the right min sign up date' do
      result = processor.process(valid_file)

      expected_result = {
        'Name' => 'Collin',
        'Email' => 'collin@testmail.com',
        'Sign Up Date' => '2018-02-02',
        'Role' => 'manager'
      }
      assert_equal expected_result, result[:min_date_record]
    end
  end

  describe 'processes invalid files' do
    it 'returns failure' do
      result = processor.process(valid_file)
      refute result[:success]
    end
  end
end
