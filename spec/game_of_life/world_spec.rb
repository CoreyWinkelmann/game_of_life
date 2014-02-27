describe GameOfLife::World do
  let(:world) { GameOfLife::World.new(3, 3) }
  context "A live cell" do
    it "with fewer than two live neighbors dies" do
      starting_grid = [[false, false, false],
                       [false, true, false],
                       [false, true, false]]
      expected = false

      world = GameOfLife::World.generate_grid(starting_grid)

      world.next_generation

      expect(world.at(1, 1)).to eq(expected)
    end

    it "with more than three live neighbors dies" do
      starting_grid = [[true, false, true],
                       [false, true, false],
                       [true, false, true]]
      expected = false

      world = GameOfLife::World.generate_grid(starting_grid)

      world.next_generation

      expect(world.at(1, 1)).to eq(expected)
    end

    it "with two or three live neighbors lives on to the next generation" do
      starting_grid = [[false, false, false],
                       [false, true, false],
                       [true, false, true]]
      expected = true

      world = GameOfLife::World.generate_grid(starting_grid)

      world.next_generation

      expect(world.at(1, 1)).to eq(expected)
    end
  end

  context "A dead cell" do
    it "with exactly three live neighbors becomes a live cell" do
      starting_grid = [[false, false, false],
                       [true, false, false],
                       [true, false, true]]
      expected = true

      world = GameOfLife::World.generate_grid(starting_grid)

      world.next_generation

      expect(world.at(1, 1)).to eq(expected)
    end
  end
end
