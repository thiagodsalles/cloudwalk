class FileParseService
  def initialize(file)
    @file = file
    @parsed_file = {}
    @game_count = 0
  end

  def call
    current_game = nil

    File.foreach(@file.path) do |line|
      current_game = init_game if line.include? 'InitGame'
      new_player(line, current_game) if line.include? 'ClientUserinfoChanged'
      if line.include? 'Kill'
        set_kill(line, current_game)
        kills_by_means(line, current_game)
      end
    end
    @parsed_file
  end

  private

  def kills_by_means(line, current_game)
    mean = line.chomp.split('by ').last.to_sym

    current_game[:kills_by_means][mean] = 0 unless current_game[:kills_by_means].key? mean
    current_game[:kills_by_means][mean] += 1
  end

  def init_game
    @game_count += 1
    @parsed_file["game_#{@game_count}".to_sym] = {
        total_kills: 0,
        players: [],
        kills: {},
        kills_by_means: {}
    }
  end

  def new_player(line, current_game)
    player = line.split('n\\', 2).last.split('\\t').first
    current_game[:players] << player unless current_game[:players].include? player
    current_game[:kills][player.to_sym] = 0
  end

  def set_kill(line, current_game)
    dead_player = line.split('killed ').last.split(' by').first
    killer_player = line.split(' killed').first.split(': ').last

    current_game[:total_kills] += 1

    if killer_player == '<world>'
      current_game[:kills][dead_player.to_sym] -= 1
    elsif killer_player != dead_player
      current_game[:kills][killer_player.to_sym] += 1
    end
  end
end
