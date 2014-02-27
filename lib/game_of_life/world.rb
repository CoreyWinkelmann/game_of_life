module GameOfLife
  class World
    attr_reader :grid

    def self.generate_grid(grid)
      self.new grid
    end

    def self.generate_random_grid(row_size, column_size)
      cell_states = [true, false]
      grid = row_size.times.map { column_size.times.map { cell_states.sample } }

      self.new grid
    end

    def initialize(grid)
      @grid = grid

      @row_size = grid.size
      @column_size = grid.first.size
    end

    def next_generation
      next_grid = Marshal.load(Marshal.dump(grid))

      grid.each_index do |row_index|
        grid[row_index].each_index do |column_index|
          next_grid[row_index][column_index] = tick(row_index, column_index)
        end
      end

      @grid = next_grid

      self
    end

    def at(row_index, column_index)
      @grid[row_index][column_index]
    end

    def to_s
      result = []
      grid.each do |row|
        result << row.map {|cell| cell ? 'o' : '.'} .join(" ")
      end

      result.join("\n")
    end

    private

    def tick(row_index, column_index)
      cell_state = grid[row_index][column_index]
      alive_neighbors = alive_neighbor_count(row_index, column_index)

      if cell_state
        if alive_neighbors < 2 || alive_neighbors > 3
          cell_state = false
        else
          cell_state = true
        end
      else
        cell_state = true if alive_neighbors === 3
      end

      cell_state
    end

    def alive_neighbor_count(row_index, column_index)
      rr = row_range(row_index)
      cr = column_range(column_index)
      alive_count = 0

      rr.each do |row_neighbor_index|
        alive_count += cr.count do |column_neighbor_index| 
          if row_neighbor_index === row_index && column_neighbor_index === column_index
            false
          else
            @grid[row_neighbor_index][column_neighbor_index]
          end
        end
      end

      alive_count
    end

    def row_range(index)
      row_start = ((index-1) < 0) ? 0 : (index-1)
      row_end = ((index+1) > (@row_size-1)) ? (@row_size-1) : (index+1)

      (row_start..row_end)
    end

    def column_range(index)
      column_start = ((index-1) < 0) ? 0 : (index-1)
      column_end = ((index+1) > (@column_size-1)) ? (@column_size-1) : (index+1)

      (column_start..column_end)
    end
  end
end
