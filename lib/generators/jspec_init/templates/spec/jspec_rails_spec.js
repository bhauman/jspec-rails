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
    ($$('#play_area').length == 1).should.be true
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
    $$('body')[0].getStyle('backgroundColor').should.not.be '#efefef'    
    $$('body')[0].getStyle('backgroundImage').should.be 'none'

    $$('body')[0].setStyle({backgroundColor:''});
    $$('body')[0].setStyle({backgroundImage:''});
    
    JspecRails.set_green();
    $$('body')[0].getStyle('backgroundColor').should.not.be '#efefef'    
    $$('body')[0].getStyle('backgroundImage').should.be 'none'    
  end

  it "should be able to load a fixture" 
    JspecRails.load_fixture('test_fixture')
    (!!JspecRails.play_area.down('#test_fixture')).should.be true
  end
   
end
