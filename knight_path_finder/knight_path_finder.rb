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
        queue = [@root_node]
        until queue.empty?
          check_node = queue.shift
            possible_moves = new_move_positions(check_node.value)
            possible_moves.each do |possible_move|
                new_child_node = PolyTreeNode.new(possible_move)
                queue.push(new_child_node)
                check_node.add_child
            end
        end
    end

    def self.valid_moves(pos)
        possible_moves = []
        MOVES.each do |adder|
            possible_moves << [adder[0] + @current_position.value[0], adder[1] + @current_position.value[1]]
        end
        possible_moves.select { |ele| ele.all? { |num| num> -1 && num < 8 } }
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        moves.reject! {|move| @considered_positions.include?(move)}
        @considered_positions.concat(moves)
        moves
    end

    def find_path(pos)

    end

end 

kpf = KnightPathFinder.new([0,0])