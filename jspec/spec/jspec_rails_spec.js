describe 'JspecRails'

  after_each 
   JspecRails.clear_fixture()
  end

  it "should exist"
    JspecRails.should.not.be null    
  end

  it "should have some fun"
    true.should.be true
  end 

  it "should create a play_area for fixtures to load"
    JspecRails.create_play_area();
    $('play_area').should.not.be null
  end

  it "should be able to clear the play_area"
    JspecRails.create_play_area();
    JspecRails.play_area.update("hello");
    $('play_area').innerHTML.should.not.be null
    JspecRails.clear_fixture();
    $('play_area').innerHTML.should.be ''
  end
  
  it "should be able to set the background to red or green" 
    JspecRails.set_red();
    $$('body')[0].getStyle('backgroundColor').should.be 'rgb(250, 136, 136)'    
    $$('body')[0].getStyle('backgroundImage').should.be 'none'    
    JspecRails.set_green();
    $$('body')[0].getStyle('backgroundColor').should.be 'rgb(136, 250, 136)'    
    $$('body')[0].getStyle('backgroundImage').should.be 'none'    
  end

  it "should be able to load a fixture" 
    JspecRails.load_fixture('test_fixture')
    JspecRails.play_area.down('#test_fixture').should.not.be null
  end
   
end
