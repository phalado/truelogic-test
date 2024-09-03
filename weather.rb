# Can receive a filename as first arg or choose w_data.dat by default
filename = ARGV.first || 'w_data.dat'

# Read the file
input = File.open(filename, File::RDONLY, &:read)

# Split the data removing spaces and remove useless lines
weather_data = input.lines.map(&:split)[6...-2]

# Transform the array data.
# The first element will be the month day and the second the temperature spread.
weather_data.map! { |day_data| [day_data.first.to_i, day_data[1].to_i - day_data[2].to_i] }

# Sort by the second element - temperature spread
weather_data.sort_by!(&:last)

# Print the first element - the day - from the first element
puts weather_data.first.first
