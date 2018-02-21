require 'erb'

class IniFileGenerator

  INI_TEMPLATE = "vagrant.ini.erb"
  INI_TARGET = "vagrant.ini"

  def initialize(vm_ip)
    @vm_ip = vm_ip
  end

  def template_binding
    binding
  end

  def get_template
    File.read(File.join(File.dirname(__FILE__), INI_TEMPLATE))
  end

  def generate_ini_file
    ini_file = File.open(File.join(File.dirname(__FILE__), INI_TARGET), "w")
    ini_file << ERB.new(self.get_template).result(self.template_binding)
    ini_file.close
  end

  def copy_dist_file(source, target)
      full_source = File.join(File.dirname(__FILE__), source)
      full_target = File.join(File.dirname(__FILE__), target)
      unless File.exists?(full_target)
        FileUtils.copy_file(full_source, full_target)
      end
    end
end
