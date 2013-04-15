module SubPod
  class TargetIntegrator < Pod::Installer::UserProjectIntegrator::TargetIntegrator
    def add_xcconfig_base_configuration
      xcconfig = pods_group.new_file(library.xcconfig_relative_path)
      targets.each do |target|
        check_overridden_build_settings(library.xcconfig, target)
        target.build_configurations.each do |config|
          config.base_configuration_reference = xcconfig
        end
      end
    end

    def pods_group
      user_project['Pods'] || user_project.new_group('Pods')
    end
  end
end
