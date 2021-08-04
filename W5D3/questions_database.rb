require "singleton"

class QuestionsDatabase < SQLite3::Database
    include Singleton 
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
    end


end

class Question
    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        QuestionsDatabase.instance.execute(<<-sql, id)
        
        sql
    end

    def initialize(options) 
        @id = options["id"]
        @title = options["title"]
        @body = options["body"]
        @user_id = options["user_id"]
    end


    def find_by_id(id)

    end

end