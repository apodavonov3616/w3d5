require_relative "../polynodetree/lib/00_tree_node.rb"

class KnightPathFinder

    attr_reader :root_node
    MOVES = [[1,2], [-1,2], [1,-2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        build_move_tree
        @considered_positions = [@root_node]
    end



    def build_move_tree
        
    end

    def self.valid_moves(pos)
        possible_moves = []
        MOVES.each do |adder|
            possible_moves << [adder[0] + @current_position.value[0], adder[1] + @current_position.value[1]]
        end
        possible_moves.select { |ele| ele.all? { |num| num> -1 && num < 8 } }
    end

    def new_move_positions(pos)

    end

end 

kpf = KnightPathFinder.new([0,0])