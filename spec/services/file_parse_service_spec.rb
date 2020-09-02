require 'rails_helper'

RSpec.describe FileParseService do
  describe 'call' do
    it 'get json' do
      service = FileParseService.new(file_fixture('qgames.log')).call
      expect(service).to eq(game_1: { total_kills: 3,
                                      players: ['Zeh',
                                                'Assasinu Credi',
                                                'Dono da Bola',
                                                'Fasano Again',
                                                'Isgalamido',
                                                'Oootsimo'],
                                      kills: { 'Zeh': -3,
                                               'Assasinu Credi': 0,
                                               'Dono da Bola': 0,
                                               'Fasano Again': 0,
                                               'Isgalamido': 0,
                                               'Oootsimo': 0 },
                                      kills_by_means: { MOD_TRIGGER_HURT: 3 } })
    end
  end
end

