class Player
  attr_accessor :name, :mark


  def initialize(name, mark, board)
    @name = name
    @mark = mark
    @board = board
  end

  def move(cell)
    @board.update_cell(cell, self.mark)
  end

  def winner?
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]]
    wins.each do |win|
      values = [cells[win[0]], cells[win[1]], cells[win[2]]]
      return true if values.include?(self.mark.to_s) &&
      ((values[0] == values[1]) && (values[1] == values[2]))
    end
    false
  end

  private

  def cells
    @board.cells
  end

end