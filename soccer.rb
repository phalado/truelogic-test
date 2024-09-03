# Can receive a filename as first arg or choose w_data.dat by default
filename = ARGV.first || 'soccer.dat'

# Read the file
input = File.open(filename, File::RDONLY, &:read)

# Split the data removing spaces and remove useless lines
teams_data = input.lines.map(&:split)[3...-1]

# Transform the array data.
# The first element will be the team's name and the second the goal difference.
teams_data.map! { |team_data| [team_data[1], team_data[6].to_i - team_data[8].to_i] }

# Sort by the second element - goal difference
teams_data.sort_by!(&:last)

# Print the first element - the name - from the last element
# In this case we need to get the last team because we want the biggest value.
puts teams_data.last.first
