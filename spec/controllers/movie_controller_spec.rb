require 'spec_helper'

describe MoviesController do
  context 'searching movies with same director' do
    before :each do
      @fake_results=[mock('movie1'),mock('movie2')]
    end
    it 'should call show same director model method' do
      Movie.should_receive(:find_same_director).with('1').
        and_return(@fake_results)
      get :similar, {:id => '1'}
    end
    it 'should select view for rendering' do
      Movie.stub(:find_same_director).and_return(@fake_results)
      get :similar, {:id => '1'}
      response.should render_template('similar')
    end
    it 'should make search results available to that template' do
      Movie.stub(:find_same_director).and_return(@fake_results)
      get :similar, {:id => '1'}
      assigns(:movies).should == @fake_results
    end
  end
end
