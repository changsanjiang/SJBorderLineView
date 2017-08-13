
Pod::Spec.new do |s|

s.name         = 'SJBorderLineView'
s.version      = '0.0.3'
s.summary      = 'border line.'
s.description  = 'https://github.com/changsanjiang/SJBorderLineView/blob/master/README.md'
s.homepage     = 'https://github.com/changsanjiang/SJBorderLineView'
s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
s.author       = { 'SanJiang' => 'changsanjiang@gmail.com' }
s.platform     = :ios, '8.0'
s.source       = { :git => 'https://github.com/changsanjiang/SJBorderLineView.git', :tag => "v#{s.version}" }
s.source_files  = 'SJBorderLineView/*.{h,m}'
s.framework  = 'UIKit'
s.requires_arc = true

end
