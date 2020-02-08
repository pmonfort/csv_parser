require 'minitest/autorun'
require 'minitest/spec'
require 'processor'

describe Processor do
  let(:processor) { Processor.new }
  let(:valid_file) { './fixtures/valid.csv' }
  let(:invalid_file) { './fixtures/invalid.csv' }

  describe 'processes valid files' do
    it 'returns success' do
      result = processor.process(valid_file)

      assert result[:success]
    end

    it 'returns the right max sign up date' do
      result = processor.process(valid_file)

      expected_result = {
        name: 'Jacob',
        email: 'jacab@testmail.com',
        sign_up_date: '2020-01-08',
        role: 'admin'
      }
      assert_equal result[:max_date_record], expected_result
    end

    it 'returns the right min sign up date' do
      result = processor.process(valid_file)

      expected_result = {
        name: 'Collin',
        email: 'collin@testmail.com',
        sign_up_date: '2018-02-02',
        role: 'manager'
      }
      assert_equal result[:min_date_record], expected_result
    end
  end

  describe 'processes invalid files' do
    it 'returns failure' do
      result = processor.process(valid_file)
      refute result[:success]
    end
  end
end
