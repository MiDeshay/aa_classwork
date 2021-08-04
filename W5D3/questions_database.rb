require "singleton"
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton 
    def initialize
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

    def self.find_by_author_id(author_id)
        datum = QuestionsDatabase.instance.execute(<<-sql, author_id)
                SELECT  *
                FROM questions
                WHERE author_id = ?
            sql
        Question.new(datum)
    end

    def self.find_by_id(id)
        datum = QuestionsDatabase.instance.execute(<<-sql, id)
                SELECT  *
                FROM questions
                WHERE id = ?
            sql
        Question.new(datum)
    end

    def initialize(options) 
        @id = options["id"]
        @title = options["title"]
        @body = options["body"]
        @user_id = options["user_id"]
    end

end

class User
    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum) }
    end

    def self.find_name(fname, lname)
        datum = QuestionsDatabase.instance.execute(<<-sql, fname, lname)
                SELECT  *
                FROM users
                WHERE fname = ? AND lname = ?
            sql
        User.new(datum)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end

##

Question.all
p User.all