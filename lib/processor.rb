require 'csv'

class Processor
  def process(csv_file_path)
    result = { success: true, min_date_record: nil, max_date_record: nil }
    CSV.parse(File.read(csv_file_path), headers: true) do |row|
      result[:min_date_record] ||= row.to_h
      result[:max_date_record] ||= row.to_h

      row_date = parse_date(row['Sign Up Date'])
      current_min_date = parse_date(result[:min_date_record]['Sign Up Date'])
      if current_min_date > row_date
        result[:min_date_record] = row.to_h
      end

      current_max_date = parse_date(result[:max_date_record]['Sign Up Date'])
      if current_max_date < row_date
        result[:max_date_record] = row.to_h
      end
    end

    result
  end

  def parse_date(date_string)
    DateTime.strptime(date_string, '%Y-%m-%d')
  end

  def validate
    #row.headers == ["Name", "Email", "Sign Up Date", "Role"]
  end

  def parse

  end
end
