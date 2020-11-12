Pod::Spec.new do |s|
    s.name         = "HelperModule"
    s.version      = "0.0.1"
    s.summary      = "This is an helper module that contain's many files that can help any other module"
    s.homepage     = "http://git.gits.id/RnD/swift-ios-framework"
    s.license      = "MIT (ios)"
    s.author             = { "GITS Indonesia" => "ajie@gits.id" }
    s.source       = { :git => "http://git.gits.id/RnD/swift-ios-framework.git", :tag => "#{s.version}" }
    s.source_files  = "HelperModule/Classes/**/*.{h,m,swift,a}"
    s.resource_bundles = {'HelperModule' => ['HelperModule/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,bundle}']}
    s.platform         = :ios, "10.0"
    s.dependency 'ChameleonFramework'
    s.dependency 'IQKeyboardManager'
    s.dependency 'IGListKit'
    s.dependency 'Material'
    s.dependency 'M13Checkbox'
    s.dependency 'PureLayout'
    s.dependency 'RxSwift'
    s.dependency 'SDWebImage'
    s.dependency 'SDWebImage/GIF'
    s.dependency 'Shimmer'
    s.dependency 'SwiftMessages'
    s.dependency 'UIColor_Hex_Swift'
end
