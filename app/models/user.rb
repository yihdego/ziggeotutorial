class User < ApplicationRecord
  before_create -> { self.uid = generate_uid }

  private

  def generate_uid
    loop do
      uid = Digest::MD5.hexdigest(self.created_at.to_s + rand(10000).to_s)
      return uid unless User.exists?(uid: uid)
    end
  end
end
