# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User
    attr_reader :photos, :name   
def initialize(name)
@name = name
end

def photos 
 Photo.all.select {|photo| photo.user == self}
end

end 

class Photo   
attr_reader :user


@@all = []

def user=(user)  
  @user = user
  @@all << self
end

def self.all 
@@all
end


def comments 
    Comment.all.select {|comment| comment.photo == self}
end

def make_comment(comment)   
    new_comment = Comment.new(comment)
    new_comment.photo = self
    Comment.all << new_comment
end

end

class Comment 
    attr_accessor :photo
    @@all = []
    
    def initialize(comment)
        @comment = comment 
    end
    
    def photo=(photo)
      @photo = photo
    end
def self.all  
@@all
end

end


sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
 sandwich_photo.user.name
# => "Sophie"
 sophie.photos
# => [#<Photo:0x00007fae2880b370>]


 sandwich_photo.comments
# => []

  sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
 p sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

 p Comment.all
#=> [#<Comment:0x00007fae28043700>]
