describe "<%= class_name -%>"
  before

  end

  before_each
    <%= file_name -%> = new <%= class_name -%>()
    JspecRails.load_fixture('<%= file_name -%>')
  end

  after_each
    delete <%= file_name %>
    JspecRails.clear_fixture()
  end

  it "should exist"
    <%= file_name -%>.should.not.be nil
  end

end