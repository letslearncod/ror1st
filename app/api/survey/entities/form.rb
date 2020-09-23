module Survey
 module Entities
  class Form < Grape::Entity
   expose :title
   expose :detail
   expose :questions, using: Survey::Entities::Question
  end
 end
end
