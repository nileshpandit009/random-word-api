class Word
  @words ||= JSON.parse(IO.readlines(File.join(Dir.pwd, '/app/assets/json_files/words.json'))[0])
  @swears ||= JSON.parse(IO.readlines(File.join(Dir.pwd, '/app/assets/json_files/swear.json'))[0])

  def self.random(limit = 10, swear: false)
    return (@words + @swears).sample(limit) if swear

    @words.sample(limit)
  end

  def self.swears(limit = 10)
    @swears.sample(limit)
  end
end
