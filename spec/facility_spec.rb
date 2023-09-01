require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

    describe '#Register Vehicle' do
      it 'starts with no vehicles' do
        expect(@facility_1.registered_vehicles).to eq([])
      end

      it 'Register a cruz' do  
        expect(@cruz.registration_date).to eq(nil)
        expect(@cruz.plate_type).to eq(:regular)
        @facility_1.register_vehicle(@cruz)
        expect(@cruz.registration_date).to eq(Date)
        expect(@facility_1.registered_vehicles).to eq([@cruz])
      end

      it 'Register camaro' do
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@camaro)
        expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
        expect(@camaro.registration_date).to eq(Date)
        expect(@camaro.plate_type).to eq(:antique)
        
      end

      it 'Register bolt' do
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@camaro)
        @facility_1.register_vehicle(@bolt)
        expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
        expect(@bolt.registration_date).to eq(Date)
        expect(@bolt.plate_type).to eq(:ev)
      end

        it 'collects a fee' do
          expect(@facility_1.collected_fees).to eq(0)
          @facility_1.register_vehicle(@cruz)
          expect(@facility_1.collected_fees).to eq(100)
          @facility_1.register_vehicle(@camaro)
          expect(@facility_1.collected_fees).to eq(125)
          @facility_1.register_vehicle(@bolt)
          expect(@facility_1.collected_fees).to eq(325)
        end

        it 'Check facility_2' do
          facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
          expect(facility_2.registered_vehicles).to eq([])
          expect(facility_2.services).to eq([])
          expect(facility_2.register_vehicle(bolt)).to eq(nil)
          expect(facility_2.registered_vehicles).to eq([])
          expect(facility_2.collected_fees).to eq(0)
        end
      end
end

