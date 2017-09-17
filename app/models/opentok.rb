# class OpenTokService < ActiveRecord::Base

#   def initialize(room)
#     @room = room
#     @opentok = OpenTok::OpenTok.new ENV["APIKEY"], ENV["SECRET"]
#   end

#   def generate_token
#     create_session unless @room.session_id.present?
#     role = :moderator #or :publisher
#     @opentok.generate_token @room.session_id, {role: role}
#   end

#   def create_session
#     tok_session = @opentok.create_session
#     # save session_id on DB, Session never expires
#     # @room.update_attributes session_id: tok_session.session_id
#   end

# end