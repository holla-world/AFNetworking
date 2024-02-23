Pod::Spec.new do |s|
  s.name     = 'AFNetworking'
  s.version  = '4.0.1.2'
  s.license  = 'MIT'
  s.summary  = 'A delightful networking framework for Apple platforms.'
  s.homepage = 'https://github.com/AFNetworking/AFNetworking'
  s.social_media_url = 'https://twitter.com/AFNetworking'
  s.authors  = { 'Mattt Thompson' => 'm@mattt.me' }
  s.source   = { :git => 'https://github.com/holla-world/AFNetworking.git', :tag => s.version }

  s.ios.deployment_target = '12.0'

  s.pod_target_xcconfig = {
    'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking',
  }

  s.source_files = 'AFNetworking/AFNetworking.h'

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking/AFSecurityPolicy.{h,m}'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '12.0'
    ss.source_files = 'AFNetworking/AFNetworkReachabilityManager.{h,m}'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworking/Serialization'
    ss.ios.dependency 'AFNetworking/Reachability'
    ss.dependency 'AFNetworking/Security'
    ss.source_files = 'AFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'
    ss.resource_bundles = {'AFNetworking' => ['Source/PrivacyInfo.xcprivacy']}
  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '12.0'
    ss.dependency 'AFNetworking/NSURLSession'
    ss.source_files = 'UIKit+AFNetworking'
  end
end
