#CREATED BY ERIN YABUT
dataset = [
#FEATURES: HP,ATTACK, DEFENSE, SPECIAL ATTACK, SPECIAL DEFENSE, SPEED, CAPTURE RATE
data_point_1 = { :label => "Legendary", :features => [90, 85, 100, 95, 125, 85, 5] }, #Articuno
data_point_2 = { :label => "Legendary", :features => [90, 90, 85, 125, 90, 100, 3] }, #Zapdos
data_point_3 = { :label => "Legendary", :features => [90, 100, 90, 125, 85, 90, 13] }, #Moltres
data_point_4 = { :label => "Legendary", :features => [106, 110, 90, 154, 90, 130, 6] }, #Mewtwo
data_point_5 = { :label => "Legendary", :features => [90, 85, 75, 115, 100, 115, 8] }, #Raikou
data_point_6 = { :label => "Legendary", :features => [115, 115, 85, 90, 75, 100, 13] }, #Entei 
data_point_7 = { :label => "Legendary", :features => [106, 130, 90, 110, 154, 90, 2] }, #Ho-Oh
data_point_8 = { :label => "Legendary", :features => [100, 150, 140, 100, 90, 90, 13] }, #Groudon
data_point_9 = { :label => "Pseudo-Legendary", :features => [91,134, 95, 100, 100, 80, 92] }, #Dragonite
data_point_10 = { :label => "Pseudo-Legendary", :features => [100,134, 110, 95, 100, 61, 93] }, #Tyranitar
data_point_11 = { :label => "Pseudo-Legendary", :features => [95, 135, 80, 110, 80, 100, 69] }, #Salamence
data_point_12 = { :label => "Pseudo-Legendary", :features => [80, 135, 130, 95, 90, 70, 13] }, #Metagross
data_point_13 = { :label => "Pseudo-Legendary", :features => [108, 130, 95, 80, 85, 102, 70] }, #Garchomp
data_point_14 = { :label => "Pseudo-Legendary", :features => [92, 105, 90, 125, 90, 98, 92] }, #Hydreigon
data_point_15 = { :label => "Pseudo-Legendary", :features => [90, 100, 70, 110, 150, 80, 93] }, #Goodra
data_point_16 = { :label => "Pseudo-Legendary", :features => [88, 120, 75, 100, 75, 142, 45]} #Dragapult
]

test_data = []
test_data2 = []
test_data3 = []
i = 0
j = 0
puts "This KNN Algorithm classifies based on 7 features: HP,ATTACK, DEFENSE, SPECIAL ATTACK, SPECIAL DEFENSE, SPEED, CAPTURE RATE"
for x in i..j do
    if i == 0
        puts "Enter features of FIRST POKEMON"
        for y in 0..6 do
            puts "Enter Stat Here:"
            stat = gets.chomp.to_i
            test_data.push(stat)
        end
        i += 1
    elsif i == 1
        puts "Enter features of SECOND POKEMON"
        for y in 0..6 do
            puts "Enter Stat Here:"
            stat = gets.chomp.to_i
            test_data2.push(stat)
        end
        i += 1
    else
        puts "Enter features of THIRD POKEMON"
        for y in 0..6 do
            puts "Enter Stat Here:"
            stat = gets.chomp.to_i
            test_data3.push(stat)
        end 
    end
end  


def classify_with_knn(data, k, unknown_data_point)
    another = []
    k_array = []
    i = 0
    sum = 0

    data.each do |point|
        point[:features].zip(unknown_data_point).each do |v1, v2|
        component = (v1 - v2)**2  
        sum += component
        end
        another << Math.sqrt(sum)
        sum = 0
    end

    data.each do |point| 
    k_array << {:label => point[:label], :distance => another[i]}
    i+=1
    end

    k_array.sort_by!{|kpoint| kpoint[:distance]}

    results = []

    results = k_array.first(k)
    # start the count
    legendary = 0
    pseudo = 0

    pseudo = results.count{|elem|elem[:label] == "Pseudo-Legendary"}
    legendary = results.count{|elem|elem[:label] == "Legendary"}
  
    
    if legendary < pseudo
         puts "Unknown stats might be from a PSEUDO-LEGENDARY pokemon with tally Legendary = #{legendary} and Pseudo-Legendary = #{pseudo}"
    elsif legendary <= pseudo then
        puts "Unknown stats cannot be determined with tally Legendary = #{legendary} and Pseudo-Legendary = #{pseudo}"
    else
        puts "Unknown stats might be from a LEGENDARY pokemon with tally Legendary = #{legendary} and Pseudo-Legendary = #{pseudo}"
    end

end

    puts classify_with_knn(dataset, 15, test_data)
    puts classify_with_knn(dataset, 7, test_data2)
    puts classify_with_knn(dataset, 5, test_data3)
    
#CREATED BY ERIN YABUT
