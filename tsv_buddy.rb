# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    students = []
    tsv.each_line { |student| students << student }
    keys = students[0].split("\t")
    keys.map!(&:chomp)
    students.shift
    students.each do |line|
      values = line.split("\t")
      record = {}
      keys.each_index { |index| record[keys[index]] = values[index].chomp }
      @data.push(record)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    first_hash = @data[0]
    keys_array = first_hash.keys
    student = ''
    keys_array.each { |key| student.concat(key + "\t") }
    student << "\n"
    @data.each do |record|
      record.each_value { |value| student << value + "\t" }
      student << "\n"
    end
    student
  end

end
