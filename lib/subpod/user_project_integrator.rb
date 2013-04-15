module SubPod
  class UserProjectIntegrator < Pod::Installer::UserProjectIntegrator
    def integrate!
      add_pods_project
      integrate_user_targets
      warn_about_empty_podfile
    end

    def integrate_user_targets
      libraries_to_integrate.sort_by(&:name).each do |lib|
        TargetIntegrator.new(lib).integrate!
      end
    end

    def add_pods_project
      user_project_paths.each do |path|
        proj = Xcodeproj::Project.new(path)
        unless pods_added?(proj, path)
          group = proj['Pods'] || proj.new_group('Pods')
          relative_path = pods_rel_path(path)
          group.new_file(relative_path)
          proj.save_as(path)
        end
      end
    end

    def pods_added?(user_project, path)
      abs_path = pods_abs_path
      rel_path = pods_rel_path(path)
      user_project.files.each do |file|
        path = file.pathname
        return true if path == abs_path || path == rel_path
      end
      false
    end

    def pods_rel_path(path)
      pods_abs_path.relative_path_from(path.parent)
    end

    def pods_abs_path
      sandbox.project_path
    end
  end
end
