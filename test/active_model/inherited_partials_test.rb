require "test_helper"

class ActiveModel::InheritedPartialsTest < ActiveSupport::TestCase
	test 'it nests partial paths' do
		assert_equal 'messages/text/message', Message::Text.new.to_partial_path
	end

	test 'it inherits partials when ones are missing' do
		assert_equal 'messages/text/message', Message::HTML.new.to_partial_path
	end

	test 'it leaves partial paths intact for base models' do
		assert_equal 'messages/message', Message.new.to_partial_path
	end
end
