require 'spec_helper'

describe Movie do

  it 'should respond to director getter' do
    movie = FactoryGirl.build(:movie)
    movie.should respond_to :director
  end

  context 'searching same director movies by movie id' do
    it 'should call find same director method with movie id' do
      Movie.should_receive(:find_same_director).
        with(hash_including :id => 1)
      Movie.find_same_director({:id => 1})
    end

    it 'should return movies with same director' do
      movie1=FactoryGirl.create(:movie, :director => "Coppola")
      movie2=FactoryGirl.create(:movie, :director => "Coppola")
      FactoryGirl.create(:movie, :director => "Lynch")

      Movie.find_same_director(movie1.id).should == [movie1,movie2]
    end

    it 'should return nil, when movie has no director' do
      movie=FactoryGirl.create(:movie, :director => nil )
      Movie.find_same_director(movie.id).should == nil
    end
    it 'should return nil, when movie has empty' do
      movie=FactoryGirl.create(:movie, :director => "" )
      Movie.find_same_director(movie.id).should == nil
    end
  end
end
