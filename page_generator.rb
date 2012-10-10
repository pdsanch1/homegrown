require 'open-uri'
require 'json'

class WebPageGenerator
  
  def retrive_students_from_api
    json_response = open("http://codemountain.com/api/students/pm.json").read
    return JSON.parse(json_response)
  end
  
  def generate_list(list_type)

    puts "<html>"
    puts "	<head>"
    puts "		<title>TSL PM Dev Students</title>"
    puts "		<link rel='stylesheet' href='reset.css' type='text/css'>"
    puts "		<link rel='stylesheet' href='styles.css' type='text/css'>"
    puts "		<link href='http://fonts.googleapis.com/css?family=Arvo'  rel='stylesheet' type='text/css'>"
    puts "	</head>"
    puts "	<body>"
    puts "		<h1>"
    puts "			TSL PM Dev Students"
    puts "		</h1>"
    puts "		<ul>"
    
    if (list_type=='random')
      student_list=[retrive_students_from_api.sample]
    else
      student_list=retrive_students_from_api
    end
    student_list.each do |student_hash|
      puts "      <li class='frame'>"
      puts "    	  <img class='thumbnail' src='http://codemountain.com#{student_hash["student"]["avatar_url"]}'>"
    
    
      puts "    	  <p class='name'>#{student_hash["student"]["name"]}</p>"
      puts "    	</li>"
    end

    puts "    </ul>"
    puts "	</body>"
    puts "</html>"

  end

  # def generate_all_students
  # 
  #   puts "<html>"
  #   puts "  <head>"
  #   puts "    <title>TSL PM Dev Students</title>"
  #   puts "    <link rel='stylesheet' href='reset.css' type='text/css'>"
  #   puts "    <link rel='stylesheet' href='styles.css' type='text/css'>"
  #   puts "    <link href='http://fonts.googleapis.com/css?family=Arvo'  rel='stylesheet' type='text/css'>"
  #   puts "  </head>"
  #   puts "  <body>"
  #   puts "    <h1>"
  #   puts "      TSL PM Dev Students"
  #   puts "    </h1>"
  #   puts "    <ul>"
  #   
  #   students=retrive_students_from_api
  #   students.each do |student_hash|
  #     puts "      <li class='frame'>"
  #     puts "        <img class='thumbnail' src='http://codemountain.com#{student_hash["student"]["avatar_url"]}'>"
  #     puts "        <p class='name'>#{student_hash["student"]["name"]}</p>"
  #     puts "      </li>"
  #   end
  # 
  #   puts "    </ul>"
  #   puts "  </body>"
  #   puts "</html>"
  # end

end



