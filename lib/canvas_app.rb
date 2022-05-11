require 'byebug'

class CanvasApp

  def initialize
    @row = 0
    @col = 0
  end


# I M N - Create a new M x N canvas with all pixels coloured white (O).
  def create(row = 250, col = 250)
    row = row
    @col = col

    @size = row*@col
    
    numbers = (1..@size).map {|i| i}
    #convert to numbers
    @grid = numbers.each_slice(@col).to_a
    
    # Convert to white
    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(@col).to_a # OR grid = Array.new(6) { Array.new(5, ' ') }
  end

# C - Clears the canvas, setting all pixels to white (O).
  def clear
    numbers = (1..@size).map {|i| i }
    #convert to numbers
    @grid = numbers.each_slice(@col).to_a
    
    # Convert to white
    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(@col).to_a
  end

  # W F
  def scale(percentage = 0)

    new_size = @size*percentage/100

    numbers = (1..new_size).map {|i| i
    }

    @grid = numbers.each_slice(@col).to_a

    white = numbers.map {|i| i = 'O'}
    @grid = white.each_slice(@col).to_a # OR grid = Array.new(6) { Array.new(5, ' ') }

  end

  def size
    @size
  end

  # S
  def show
    @grid
  end


# L X Y C
  def colour_pixel(row, col, colour)
    new_value = colour
    @grid[row][col] = new_value
  end

# F X Y C
# Change this so it just fills over everything
  def fill(row, col, colour)
    move_right_fill(row,col)
    move_left_fill(row,col)
  end


  # V X Y1 Y2 C
  # need to adjust fill_up to only fill between Y1 to Y2 going vertically along X.
  def vert_draw(row1, row2, col, colour = '', grid = '@grid')
    grid = grid
    new_value = "X"
    @grid[row1][col] = new_value
    #draw_down
    if row1 <= row2
      while row1 >= 0 && row1 < @grid.length-1
        row1 = row1+1
        col = col
        pos_value = @grid[row1][col]
        p "row_index: #{row1}, col_index: #{col}"
        p "position_value: #{pos_value}"
        if row1 == row2
          @grid[row1][col] = new_value
          break
        elsif pos_value != "O"
          break
        elsif row1 >= @grid.length-1
          @grid[row1][col] = new_value
          break
        elsif pos_value == "O"
            @grid[row1][col] = new_value
        else
        end
      end
    
    # draw_up
    elsif row1 >= row2
      # if row2 < row1, fill_up to row2
      while row1 > 0
        row1 = row1-1
        col = col
        pos_value = @grid[row1][col]
        p "row_index: #{row1}, col_index: #{col}"
        p "position_value: #{pos_value}"
        if row1 == row2
          @grid[row1][col] = new_value
          break
        elsif pos_value == "O"
           @grid[row1][col] = new_value
        elsif pos_value != "O"
          next
          # or break
        else
        end
      end
    else
    end
  end

  # H X1 X2 Y C
  # Horizontal draw
  def horiz_draw(col1, col2, row, colour = '', grid = '@grid')
    grid = grid
    new_value = "X"
    @grid[row][col1] = new_value
    # draw left
    if col1 >= col2
      while col1 >= 0
        row = row
        col1 = col1-1
        pos_value = @grid[row][col1]
        # p "row_index: #{row}, col_index: #{col}"
        # p "position_value: #{pos_value}"
        if col1 == col2
          @grid[row][col1] = new_value
          break
        elsif pos_value == "O"
           @grid[row][col1] = new_value
        elsif pos_value != "O"
          break
        else
        end
      end
    # draw right
    elsif col1 <= col2
      while col1 >= 0
        row = row
        col1 = col1+1
        pos_value = @grid[row][col1]
        # p "row_index: #{row}, col_index: #{col1}"
        # p "position_value: #{pos_value}"
        if col1 == col2
          @grid[row][col1] = new_value
          break
        elsif pos_value == "O"
          @grid[row][col1] = new_value
        elsif pos_value != "O"
          break
        else
        end
      end
    else
    end
  end
  
  
  

  # ?
  # Add program help here
  def help
    'Hello this is where all the help WILL be : )'
    # I M N
    'Create a New Blank Canvas'
    'Action_name: create(row,col)'
    'Description: Use this action to create a new canvas with the desired size
     given in height(row) and width(col), after this hit enter to create.'
    # C
    'Clear the Current Canvas'
    'Action_name: clear'
    'Description: Clears all the canvas : )'
    # W F
    'Scale the Canvas'
    'Action_name: scale'
    'Description: Scales the canvas up or down depending on percentage input.'
    # S
    'Show the Canvas'
    'Action_name: show'
    'Description: Shows the canvas and its current state.'
    # L X Y C
    'Colour a Pixel'  
    'Action_name: colour_pixel(row, col, colour)'
    'Description: This action colours a specific area on the canvas, determined by
     the given height(row), width(col) and colour(colour), after this hit enter 
     to paint the pixel.'
    # F X Y C
    'Paint Fill Tool'
    'Action_name: fill(row,col,colour)'
    'Description: This action fills an area/shape that is enclosed by a  
     one colour. 
     To use, enter the desired position to start filling given by height(row), 
     width(col) and colour(colour), after this hit enter to fill.'
    # V X Y1 Y2 C
     'Paint a Vertical Line'
     'Action_name: vert_draw(row1, row2, color, colour)'
     'Description: Paints a line between two given vertical points on, given by 
      height(row1) & (row2), and the horizontal location given by (col) and colour
      given by (colour), after entering the desired points and color, hit enter to
      paint the line.'
    # H X1 X2 Y C
     'Paint a Horizontal Line'
     'Action_name: horiz_draw(col1, col2, row, colour)'
     'Description: Paints a line between two given horizontal points on, given by 
      width(col1) & (col2), and the vertical location given by (row) and colour
      given by (colour), after entering the desired points and color, hit enter to
      paint the line.'
    # X
      'Exit Program'
      'Action_name: X)'
      'Description: exits the program : )'

    # ?
    'Help'
    'Action_name: help)'
    'Description: We\'re here : )'
  end

  # X 
  def X
    exit
  end

  private 

  def move_left_fill(row, col)
    while col >= 0
      fill_up(row, col, @grid) unless col < 0
      fill_down(row, col, @grid) unless col < 0
      row = row
      col = col-1
      pos_value = @grid[row][col]
      # p "row_index: #{row}, col_index: #{col}"
      # p "position_value: #{pos_value}"
      if pos_value != "O"
       break
      end
    end
  end

  def move_right_fill(row, col) 
    while col >= 0
      fill_up(row, col, @grid) unless col < 0
      fill_down(row, col, @grid) unless col < 0
      row = row
      col = col+1
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
       break
      end
    end
  end 

  def fill_up(row, col, grid = '@grid')
    grid = grid
    new_value = "X"
    @grid[row][col] = new_value
    while row > 0
      row = row-1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value == "O"
         @grid[row][col] = new_value
      elsif pos_value != "O"
        break
        # or break
      else
      end
    end
  end

  def fill_down(row, col, grid = '@grid')
    grid = grid
    new_value = "X"
    @grid[row][col] = new_value
    while row >= 0 && row < @grid.length-1
      row = row+1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
        break
      elsif row >= @grid.length-1
        @grid[row][col] = new_value
        break
      elsif pos_value == "O"
          @grid[row][col] = new_value
      else
      end
    end
  end
  
  def move_up(row, col)
    while row > 0
      @row = row-1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
        break
      else
      end
    end
  end
  
  def move_down(row, col)
    while row >= 0
      row = row+1
      col = col
      pos_value = @grid[row][col]
      p "row_index: #{row}, col_index: #{col}"
      p "position_value: #{pos_value}"
      if pos_value != "O"
        break
      elsif row >= @grid.length-1
        break
      else
      end
    end
  end
end