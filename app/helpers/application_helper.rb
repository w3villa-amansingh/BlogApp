module ApplicationHelper
    def gravatar_for(user,option ={size:80})
        email_address = user .email_id .downcase
        hash = Digest::MD5.hexdigest(email_address)
        size=option[:size]
        gravatar_url="https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url,alt:user.username,class:"rounded mx-auto d-block")
    end
end
