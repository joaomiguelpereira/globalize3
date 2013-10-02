require File.expand_path('../../test_helper', __FILE__)

class TranslatedAttributesQuery < MiniTest::Spec
  it 'finds record in translation table' do
    post = Post.create(:title => 'a post title')
    assert_equal Post.where(:title => 'a post title').first, post
  end
end
