class Paint

  WHITE = 'O'

  def pour(grid, row, col, colour)
    @grid = grid
    move_right_fill(row, col, colour)
    move_left_fill(row, col, colour)
  end

  def current_canvas_colour
    @grid[row1][col]
  end

  def move_left_fill(row, col, colour = 'X')
    while col >= 0
      fill_up(row, col, colour) unless col < 0
      fill_down(row, col, colour) unless col < 0
      col -= 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
       break
      end
    end
  end

  def move_right_fill(row, col, colour) 
    while col >= 0
      fill_up(row, col, colour) unless col < 0
      fill_down(row, col, colour) unless col < 0
      col += 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
       break
      end
    end
  end 

  def fill_up(row, col, colour)
    new_colour = colour
    @grid[row][col] = new_colour
    while row > 0
      row -= 1
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour == WHITE
         @grid[row][col] = new_colour
      elsif current_canvas_colour != WHITE
        break
      else
      end
    end
  end

  def fill_down(row, col, colour)
    new_colour = colour
    current_canvas_colour = new_colour
    while row >= 0 && row < @grid.length-1
      row = row+1
      col = col
      current_canvas_colour = @grid[row][col]
      if current_canvas_colour != WHITE
        break
      elsif row >= @grid.length-1
        @grid[row][col] = new_colour
        break
      elsif current_canvas_colour == WHITE
          @grid[row][col] = new_colour
      else
      end
    end
  end

  def begin_paint_v(v_row1, v_row2, v_col, new_colour)
    @v_row1 = v_row1
    @v_row2 = v_row2
    @v_col = v_col
    @new_colour = new_colour
    if @v_row1 <= @v_row2
      paint_down
    elsif @v_row1 >= @v_row2
      paint_up
    else
    end
  end

  def begin_paint_h
    if @h_col1 >= @h_col2
      paint_left
    elsif @h_col1 <= @h_col2
      paint_right
    else
    end
  end

  def v_original_colour
    @grid[@v_row1][@v_col]
  end

  def paint_down
    while @v_row1 >= 0 && @v_row1 < @grid.length-1
      @v_row1 += 1
      if @v_row1 == @v_row2
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif v_original_colour != WHITE
        break
      elsif @v_row1 >= @grid.length-1
        @grid[@v_row1][@v_col] = @new_colour
        break
      elsif v_original_colour == WHITE
          @grid[@v_row1][@v_col] = @new_colour
      else
      end
    end
  end

  def paint_up
    while @v_row1 > 0
      @v_row1 -= 1
      if @v_row1 == @v_row2
        v_original_colour = @new_colour
        break
      elsif v_original_colour == WHITE
         v_original_colour = @new_colour
      elsif v_original_colour != WHITE
        next
      else
      end
    end
  end

  def h_original_colour
    @grid[row][col1]
  end

  def paint_left
    while col1 >= 0
      col1 -= 1
      if col1 == col2
        h_original_colour = @h_new_colour
        break
      elsif h_original_colour == WHITE
        h_original_colour = @h_new_colour
      elsif h_original_colour != WHITE
        break
      else
      end
    end
  end

  def paint_right
    while @h_col1 >= 0
      @h_col1 += 1
      current_canvas_colour = @grid[@h_row][@h_col1]
      if @h_col1 == @h_col2
        @grid[@h_row][@h_col1] = @h_new_colour
        break
      elsif current_canvas_colour == WHITE
        @grid[@h_row][@h_col1] = @h_new_colour
      elsif current_canvas_colour != WHITE
        break
      else
      end
    end
  end

  private

end