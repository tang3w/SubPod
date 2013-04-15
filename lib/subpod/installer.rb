module SubPod
  class Installer < Pod::Installer
    def integrate_user_project
      UI.section 'Integrating client project' do
        root = config.installation_root
        integrator = UserProjectIntegrator.new(podfile, sandbox, root, libraries)
        integrator.integrate!
      end
    end
  end
end
