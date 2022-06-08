require_relative "../helpers/table_helper"

class DataMunger
  include TableHelper

  def initialize(data)
    @data = data
  end

  def munge_data(data)
    convert_data_to_array(data)
      .then { remove_empty_rows(_1) }
      .then { normalise_cell_data(_1) }
      .then { convert_numbers_to_integers(_1) }
      .then { remove_header_and_footer(_1) }
  end

  private

  def convert_data_to_array(data)
    data.lines.map(&:split)
  end

  def normalise_cell_data(data)
    data.map do |row|
      row.map do |cell| 
        cell_is_decimal_number?(cell) ? cell : cell.gsub(/\W/, "")
      end.reject { |cell| cell.empty? }
    end
  end

  def convert_numbers_to_integers(data)
    data.map do |row|
      row.map { |cell| cell_is_not_number?(cell) ? cell : cell.to_i }
    end
  end

  def remove_header_and_footer(data)
    data.map { |line| line unless cell_is_not_number?(line[0]) }.reject(&:nil?)
  end

  def remove_empty_rows(data)
    data.map { |row| row_is_empty?(row) ? next : row }.reject { |row| row.nil? }
  end
end
