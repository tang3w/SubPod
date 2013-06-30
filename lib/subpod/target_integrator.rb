module SubPod
  class TargetIntegrator < Pod::Installer::UserProjectIntegrator::TargetIntegrator
    def add_xcconfig_base_configuration
          xcconfig = pods_group.files.select { |f|
            f.path == target.xcconfig_relative_path
          }.first || pods_group.new_file(target.xcconfig_relative_path)

          native_targets.each do |native_target|
            check_overridden_build_settings(target.xcconfig, native_target)
            native_target.build_configurations.each do |config|
              config.base_configuration_reference = xcconfig
            end
          end
        end

    def pods_group
      user_project['Pods'] || user_project.new_group('Pods')
    end
  end
end
