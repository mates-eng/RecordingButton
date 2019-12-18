Pod::Spec.new do |spec|
  spec.name         = "RecordingButton"
  spec.version      = "1.0"
  spec.summary      = "RecordingButton can show dots animation for recording status."
  spec.description  = <<-DESC
  The Recording Animation SDK for iOS.
                   DESC
  spec.homepage     = "https://github.com/mates-eng/RecordingButton"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Taisuke Kondo" => "taisuke_kondo@mates-system.com" }
  spec.platform     = :ios, "9.3"
  spec.source       = { :git => "https://github.com/mates-eng/RecordingButton.git", :tag => "#{spec.version}" }
  spec.source_files = 'RecordingButton/*.swift', 'RecordingButton/Extensions/*.swift'
  spec.swift_version = "5.0"
  spec.requires_arc = true
end
