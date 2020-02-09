# frozen_string_literal: true

require 'csv'

class Processor
  HEADERS = %w[Email Name Role Sign\ Up\ Date].freeze

  def process(csv_file_path)
    result = { success: false, min_date_record: nil, max_date_record: nil }
    counter = 0
    CSV.parse(File.read(csv_file_path), headers: true) do |row|
      counter += 1

      return result unless valid?(row, counter)

      result[:min_date_record] ||= row.to_h
      result[:max_date_record] ||= row.to_h

      row_date = parse_date(row['Sign Up Date'])
      current_min_date = parse_date(result[:min_date_record]['Sign Up Date'])
      result[:min_date_record] = row.to_h if current_min_date > row_date

      current_max_date = parse_date(result[:max_date_record]['Sign Up Date'])
      result[:max_date_record] = row.to_h if current_max_date < row_date
    end

    result[:success] = true
    result
  end

  private

  def valid?(row, counter)
    # Validate file headers only on the first row
    return false if counter == 1 && !valid_file_headers?(row)

    valid_row?(row)
  end

  def parse_date(date_string)
    DateTime.strptime(date_string, '%Y-%m-%d')
  rescue
    nil
  end

  def valid_date?(input)
    !parse_date(input).nil?
  end

  def valid_file_headers?(row)
    row.headers.sort == HEADERS
  end

  def valid_row?(row)
    all_headers_present = HEADERS.all? do |header|
      !row[header].nil?
    end
    return false unless all_headers_present

    valid_date?(row['Sign Up Date']) && valid_email?(row['Email'])
  end

  def valid_email?(email)
    !(URI::MailTo::EMAIL_REGEXP =~ email).nil?
  end

  def valid_headers?(headers)
    headers.sort == HEADERS
  end
end
