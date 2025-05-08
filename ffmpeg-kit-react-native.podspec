require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source = { :git => 'https://github.com/BedoEbied/ffmpeg-kit-react-native.git', :tag => "react.native.v#{s.version}", }
	
  s.default_subspec   = 'min-gpl'

  s.dependency "React-Core"

  s.libraries = [ "z", "bz2", "c++", "iconv" ]
  s.frameworks = [ "AudioToolbox", "AVFoundation", "CoreMedia", "VideoToolbox" ]

  s.subspec 'min-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
			ss.vendored_frameworks = [
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/ffmpegkit.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libavcodec.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libavdevice.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libavfilter.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libavformat.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libavutil.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libswresample.xcframework',
				'frameworks/ffmpeg-kit-min-gpl-6.0-ios-xcframework/libswscale.xcframework'
			]
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'full-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
			ss.vendored_frameworks = [
    		'frameworks/ffmpeg-kit-ios-full-gpl/ffmpegkit.xcframework',
    		'frameworks/ffmpeg-kit-ios-full-gpl/libavcodec.xcframework',
    		'frameworks/ffmpeg-kit-ios-full-gpl/libavdevice.xcframework',
    		'frameworks/ffmpeg-kit-ios-full-gpl/libavfilter.xcframework',
    		'frameworks/ffmpeg-kit-ios-full-gpl/libavformat.xcframework',
    		'frameworks/ffmpeg-kit-ios-full-gpl/libavutil.xcframework',
   		  'frameworks/ffmpeg-kit-ios-full-gpl/libswresample.xcframework',
    		'frameworks/ffmpeg-kit-ios-full-gpl/libswscale.xcframework'
			]
      ss.ios.deployment_target = '12.1'
  end

end
