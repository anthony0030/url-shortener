require 'test_helper'

class MetadataTest < ActiveSupport::TestCase
  test 'title' do
    assert_equal 'My Title', Metadata.new('<title>My Title</title>').title
  end

  test 'missing title' do
    assert_nil Metadata.new.title
  end

  test 'description' do
    assert_equal 'My Description', Metadata.new('<meta name="description" content="My Description">').description
  end

  test 'missing description' do
    assert_nil Metadata.new.description
  end

  test 'image' do
    assert_equal 'My Image', Metadata.new('<meta property="og:image" content="My Image">').image
  end

  test 'missing image' do
    assert_nil Metadata.new.image
  end
end
