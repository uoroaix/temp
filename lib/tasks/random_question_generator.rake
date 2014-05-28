namespace :generator do
  desc "Generate ten questions and ten answers for each question"
  task :generate_questions_and_answers => :environment do

    10.times do
      question = Question.create(title: Faker::Lorem.sentence(10), description: Faker::Lorem.sentence(30))
      10.times do
        question.answers.create(body: Faker::Company.bs)
      end
    end  
  end

end
