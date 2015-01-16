module SimpleCommand
  class NotImplementedError < ::StandardError; end

  class Errors < Hash
    def add_error(key, value)
      self[key] ||= []
      self[key] << value
      self[key].uniq!
    end

    def add_multiple_errors(errors_hash)
      errors_hash.each do |key, values|
        values.each { |value| add_error key, value }
      end
    end
  end
end
