module Codebreaker
  module Store
    def store_data(hash, file)
      stats = File.file?(file) && !File.zero?(file) ? load_data(file) : []
      stats << hash
      file = File.open(file, 'w')
      file.write(stats.to_yaml)
      file.close
    end

    def load_data(file)
      YAML.load_file(file)
    end
  end
end
