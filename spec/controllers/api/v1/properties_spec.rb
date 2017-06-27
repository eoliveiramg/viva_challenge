require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :controller do
  describe "POST 'create'" do
    subject { post :create, params: param_attributes, format: :json }

    let(:param_attributes) do
      {
        x: x,
        y: y,
        title: Faker::Lorem.sentence,
        price:  Faker::Number.decimal(6),
        description: Faker::Lorem.paragraph,
        beds: beds,
        baths: baths,
        squareMeters: square_meters
      }
    end
    let(:x) { Faker::Number.between(0, 1400) }
    let(:y) { Faker::Number.between(0, 1000) }
    let(:beds) { Faker::Number.between(1, 5) }
    let(:baths) { Faker::Number.between(1, 4) }
    let(:square_meters) { Faker::Number.between(20, 240) }

    context 'when params is correct' do
      it 'creates a new Property' do
        expect { subject }.to change(Property, :count).by(1)
      end

      it 'return status code equal 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when coords already exist' do
      let(:x) { 500 }
      let(:y) { 600 }

      before { subject }

      it 'creates a new Property' do
        expect { subject }.to change(Property, :count).by(0)
      end
    end

    context 'when beds is more then 5' do
      let(:beds) { Faker::Number.between(6, 10) }

      it 'not creates a new Property' do
        expect { subject }.to change(Property, :count).by(0)
      end

      it 'returns unprocessable entity error' do
        expect(subject.status).to eq(422)
        expect(subject.message).to eq("Unprocessable Entity")
      end
    end

    context 'when squareMeters is more then 240' do
      let(:square_meters) { Faker::Number.between(600, 1000) }

      it 'not creates a new Property' do
        expect { subject }.to change(Property, :count).by(0)
      end

      it 'returns unprocessable entity error' do
        expect(subject.status).to eq(422)
        expect(subject.message).to eq("Unprocessable Entity")
      end
    end

    context 'when baths is more then 4' do
      let(:baths) { Faker::Number.between(5, 10) }

      it 'not creates a new Property' do
        expect { subject }.to change(Property, :count).by(0)
      end

      it 'returns unprocessable entity error' do
        expect(subject.status).to eq(422)
        expect(subject.message).to eq("Unprocessable Entity")
      end
    end
  end

  describe 'GET #index' do
    let(:properties) { create_list(:property, 10) }

    context 'when receive get without params' do
      subject { get :index, format: :json }

      it 'return status code equal 200 and render JSON tha includes properties' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when receive get with params' do
      subject { get :index, params: params, format: :json }

      let(:params) { { ax: 0, ay: 10, bx: 20, by: 30 } }

      it 'return status code equal 200 and render JSON tha includes properties' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    let(:property) { create(:property) }

    subject { get :show, params: { id: property.id }, format: :json }

    it 'return status code equal 200 and render JSON tha includes properties' do
      expect(response).to have_http_status(:ok)
    end
  end
end
