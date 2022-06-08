module TableHelper
  def row_is_empty?(row)
    row.empty? || row.all? { |cell| cell_is_empty?(cell) }
  end

  def cell_is_empty?(cell)
    cell.empty? || cell.match(/^\W+$/)
  end

  def cell_is_not_number?(cell)
    false if Float(cell) rescue true
  end

  def cell_is_decimal_number?(cell)
    /^\w+.\w+/.match?(cell.to_s)
  end
end
 