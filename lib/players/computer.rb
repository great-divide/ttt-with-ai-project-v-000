module Players
  class Computer < Player
    
  WIN_COMBINATIONS = [ 
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def move(board)
    all_moves = %w[1 2 3 4 5 6 7 8 9]
    valid_moves = []
    all_moves.each { |n| 
      if board.valid_move?(n) 
        valid_moves << n 
      end
    }
    # valid_moves.sample
  
    x_spots = board.cells.each_index.select{|i| board.cells[i] == "X"}  
    defense_indexes = []   
     WIN_COMBINATIONS.each do |combo|
       combo.each do |index|
         if x_spots.include?(index)
           defense_indexes << index
         end
       end
     end
    defense_indexes.flatten
    defense_moves = defense_indexes.each do |n| 
      n.to_i + 1 
      end
    valid_defense_moves = []
    defense_moves.each do |n| 
      if board.valid_move?(n)
        valid_defense_moves << n
      end
    if !valid_defense_moves.empty?
      return valid_defense_moves.sample
    else return valid_moves.sample
    end
  end
end
end
end