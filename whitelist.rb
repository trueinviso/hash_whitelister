class Whitelist
  def self.whitelist(hash, *keys)
    return {} if hash.nil?
    return {} if keys.empty?
    result = Hash.new
    keys.each do |key|
      if hash[key].is_a?(Hash)
        result[key] = whitelist(hash[key], *keys)
      else
        next unless hash.has_key?(key)
        result[key] = hash[key]
      end
    end
    result
  end
end
