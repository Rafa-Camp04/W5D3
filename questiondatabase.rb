require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User < SQLite3::Database

    def self.find_by_id(id)
        user = QuestionsDatabase.new.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                users
            WHERE
                id = ?
        SQL
        return nil if !user.length > 0

        User.new(user.first)
    end

end

class Question < SQLite3::Database

    def self.find_by_id(id)
        question = QuestionsDatabase.new.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                questions
            WHERE
                id = ?
        SQL
        return nil if !question.length > 0

        Question.new(question.first)
    end

end

class QuestionFollow < SQLite3::Database

    def self.find_by_id(id)
        question_follow = QuestionsDatabase.new.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                question_follows
            WHERE
                id = ?
        SQL
        return nil if !question_follow.length > 0

        QuestionFollow.new(question_follow.first)
    end

end

class Replie < SQLite3::Database

    def self.find_by_id(id)
        replie = QuestionsDatabase.new.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                replies
            WHERE
                id = ?
        SQL
        return nil if !replie.length > 0

        Replie.new(replie.first)
    end

end

class QuestionLike < SQLite3::Database

    def self.find_by_id(id)
        question_like = QuestionsDatabase.new.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM 
                question_likes
            WHERE
                id = ?
        SQL
        return nil if !question_like.length > 0

        QuestionLike.new(question_like.first)
    end

end
