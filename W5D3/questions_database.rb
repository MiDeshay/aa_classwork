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
    attr_accessor :id, :title, :body, :user_id
    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_author_id(user_id)
        datum = QuestionsDatabase.instance.execute(<<-sql, user_id)
                SELECT  *
                FROM questions
                WHERE user_id = ?
            sql
        if !datum.empty? 
            datum.each do |data|
            Question.new(data)
            end
        end
    end

    def self.find_by_id(id)
        datum = QuestionsDatabase.instance.execute(<<-sql, id)
                SELECT  *
                FROM questions
                WHERE id = ?
            sql
        if !datum.empty? 
            datum.each do |data|
            Question.new(data)
            end
        end
    end

    def initialize(options) 
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def author
        QuestionsDatabase.instance.execute(<<-sql, @id)
            SELECT users.fname, users.lname
            FROM users
            JOIN questions ON users.id = questions.user_id
            WHERE questions.id = ? 
        sql
    end

    def replies 
        Reply.find_by_question_id(@id)
    end

    def followers
        QuestionFollow.followers_for_question_id(@id) 
    end

end

class User
    attr_accessor :id, :fname, :lname
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

    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Reply.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(@id) 
    end
end

class Reply
    attr_accessor :id, :body, :user_id, :question_id, :parent_id
    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_user_id(user_id)
        datum = QuestionsDatabase.instance.execute(<<-sql, user_id)
                SELECT  *
                FROM replies
                WHERE user_id = ?
            sql
            if !datum.empty? 
                datum.each do |data|
                Reply.new(data)
                end
            end
    end

    def self.find_by_question_id(question_id)
        datum = QuestionsDatabase.instance.execute(<<-sql, question_id)
                SELECT  *
                FROM replies
                WHERE question_id = ?
            sql
            if !datum.empty? 
                datum.each do |data|
                Reply.new(data)
                end
            end
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
    end

    def author 
        QuestionsDatabase.instance.execute(<<-sql, @id)
        SELECT users.fname, users.lname
        FROM users
        JOIN replies ON replies.user_id = users.id
        WHERE replies.id = ?
        sql
    end

    def question
        QuestionsDatabase.instance.execute(<<-sql, @id)
        SELECT questions.title 
        FROM questions 
        JOIN replies ON replies.question_id = questions.id 
        WHERE replies.id = ? 
        sql
    end

    def parent_reply 
        QuestionsDatabase.instance.execute(<<-sql, @parent_id)
        SELECT replies.body 
        FROM replies
        WHERE id = ?
        sql
    end

    def child_replies 
        QuestionsDatabase.instance.execute(<<-sql, @id)
        SELECT replies.body 
        FROM replies
        WHERE parent_id = ?
        sql
    end
end

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
        data.map { |datum| QuestionFollow.new(datum) }
    end
    
    def self.most_followed_questions(n)

    end

    def self.followers_for_question_id(question_id)
        arr = QuestionsDatabase.instance.execute(<<-sql, question_id)
        SELECT users.id, users.fname, users.lname 
        FROM users
        JOIN question_follows ON question_follows.user_id = users.id 
        JOIN questions ON questions.id = question_follows.question_id
        WHERE questions.id = ?
        sql
        if !arr.empty?
            new_arr = []
            arr.each do |user|
                new_arr << User.new(user)
            end
            return new_arr
        end
        nil
    end

    def self.followed_questions_for_user_id(user_id)
        arr = QuestionsDatabase.instance.execute(<<-sql, user_id)
        SELECT questions.id, questions.title, questions.body, questions.user_id
        FROM questions
        JOIN question_follows ON question_follows.question_id = questions.id
        JOIN users ON users.id = question_follows.user_id
        WHERE users.id = ?
        sql
        if !arr.empty?
            new_arr = []
            arr.each do |user|
                new_arr << Question.new(user)
            end
            return new_arr
        end
        nil
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

end




#  p QuestionFollow.followed_questions_for_user_id(1)
p Question.all[0].followers 