module Survey
 module Entities
  class Question < Grape::Entity
   expose :title
   expose :desc
   expose :questiontype
  end
 end
end
