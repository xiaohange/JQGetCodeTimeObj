Pod::Spec.new do |s|
s.name         = "JQGetCodeTimeObj"
s.version      = "1.0.0"
s.summary      = "获取动态验证码."
s.homepage     = "https://github.com/xiaohange/JQGetCodeTimeObj"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Hari" => "532167805@qq.com" }
s.platform     = :ios, "8.0"
s.ios.deployment_target = "8.0"
s.source       = { :git => "https://github.com/xiaohange/JQGetCodeTimeObj.git", :tag => s.version.to_s }
s.social_media_url = 'https://weibo.com/hjq995'
s.requires_arc = true
s.source_files = 'JQGetCodeTimeObj/JQGetCodeTimeObj/**/*'

end

